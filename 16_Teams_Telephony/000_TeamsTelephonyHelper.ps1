<#
.SYNOPSIS
    Gemeinsame Hilfsfunktionen fuer generierte Teams-Telefonie-Skripte.
#>

function Initialize-TtSession {
    param(
        [switch]$SkipConnect
    )

    if ($SkipConnect) {
        return
    }

    if (Get-Command Connect-MicrosoftTeams -ErrorAction SilentlyContinue) {
        try {
            Connect-MicrosoftTeams -ErrorAction Stop | Out-Null
        } catch {
            Write-Warning "Automatische Teams-Anmeldung fehlgeschlagen: $($_.Exception.Message)"
        }
    }
}

function Ensure-TtCommand {
    param(
        [string[]]$Commands
    )

    $missing = @()
    foreach ($command in $Commands) {
        if (-not (Get-Command $command -ErrorAction SilentlyContinue)) {
            $missing += $command
        }
    }

    if ($missing.Count -gt 0) {
        throw "Fehlende Befehle: $($missing -join ', '). Installiere oder lade das MicrosoftTeams-Modul und stelle eine Session her."
    }
}

function Convert-TtValue {
    param(
        [object]$Value
    )

    if ($null -eq $Value) {
        return $null
    }

    if ($Value -is [string]) {
        return $Value
    }

    if ($Value -is [System.Collections.IEnumerable]) {
        return (@($Value) | ForEach-Object {
            if ($_ -is [string]) { $_ } else { $_ | Out-String }
        } | ForEach-Object { $_.Trim() } | Where-Object { $_ }) -join "; "
    }

    return $Value
}

function Get-TtProp {
    param(
        [object]$InputObject,
        [string]$Path
    )

    if ($null -eq $InputObject -or [string]::IsNullOrWhiteSpace($Path)) {
        return $null
    }

    $current = $InputObject
    foreach ($segment in ($Path -split '\.')) {
        if ($null -eq $current) {
            return $null
        }

        if ($segment -eq "Count") {
            if ($current -is [string]) {
                if ([string]::IsNullOrWhiteSpace($current)) {
                    return 0
                }
                return 1
            }

            if ($current -is [System.Collections.IEnumerable]) {
                $current = @($current).Count
            } else {
                $prop = $current.PSObject.Properties["Count"]
                $current = if ($prop) { $prop.Value } else { $null }
            }
            continue
        }

        if ($current -is [System.Collections.IEnumerable] -and -not ($current -is [string])) {
            $values = foreach ($entry in @($current)) {
                if ($null -eq $entry) { continue }
                $prop = $entry.PSObject.Properties[$segment]
                if ($prop) { $prop.Value }
            }
            $current = @($values)
            continue
        }

        $prop = $current.PSObject.Properties[$segment]
        if (-not $prop) {
            return $null
        }

        $current = $prop.Value
    }

    return $current
}

function Select-TtProps {
    param(
        [object[]]$Items,
        [hashtable]$PropertyMap
    )

    $result = foreach ($item in @($Items)) {
        $row = [ordered]@{}
        foreach ($key in $PropertyMap.Keys) {
            $row[$key] = Convert-TtValue (Get-TtProp -InputObject $item -Path $PropertyMap[$key])
        }
        [pscustomobject]$row
    }

    return @($result)
}

function Where-TtHasValue {
    param(
        [object[]]$Items,
        [string]$Path
    )

    return @($Items | Where-Object {
        $value = Get-TtProp -InputObject $_ -Path $Path
        if ($null -eq $value) { return $false }
        $text = [string](Convert-TtValue $value)
        return -not [string]::IsNullOrWhiteSpace($text)
    })
}

function Where-TtMissingValue {
    param(
        [object[]]$Items,
        [string]$Path
    )

    return @($Items | Where-Object {
        $value = Get-TtProp -InputObject $_ -Path $Path
        if ($null -eq $value) { return $true }
        $text = [string](Convert-TtValue $value)
        return [string]::IsNullOrWhiteSpace($text) -or $text -eq "0"
    })
}

function Where-TtMatch {
    param(
        [object[]]$Items,
        [string]$Path,
        [string]$Pattern
    )

    return @($Items | Where-Object {
        ([string](Convert-TtValue (Get-TtProp -InputObject $_ -Path $Path))) -match $Pattern
    })
}

function Where-TtMatchIssue {
    param(
        [object[]]$Items,
        [string]$Path,
        [string]$Pattern,
        [switch]$ExpectMatch
    )

    return @($Items | Where-Object {
        $value = [string](Convert-TtValue (Get-TtProp -InputObject $_ -Path $Path))
        if ([string]::IsNullOrWhiteSpace($value)) {
            return $false
        }

        $matches = $value -match $Pattern
        if ($ExpectMatch) {
            return -not $matches
        }

        return $matches
    })
}

function Group-TtByPath {
    param(
        [object[]]$Items,
        [string]$Path,
        [string]$Label = "Value"
    )

    $rows = foreach ($item in @($Items)) {
        $value = Convert-TtValue (Get-TtProp -InputObject $item -Path $Path)
        [pscustomobject]@{
            GroupValue = if ([string]::IsNullOrWhiteSpace([string]$value)) { "<Empty>" } else { [string]$value }
        }
    }

    return @(
        $rows |
            Group-Object GroupValue |
            Sort-Object Count -Descending |
            ForEach-Object {
                $row = [ordered]@{}
                $row[$Label] = $_.Name
                $row["Count"] = $_.Count
                [pscustomobject]$row
            }
    )
}

function Get-TtDuplicateValues {
    param(
        [object[]]$Items,
        [string]$Path,
        [string]$Label = "Value"
    )

    $rows = foreach ($item in @($Items)) {
        $value = [string](Convert-TtValue (Get-TtProp -InputObject $item -Path $Path))
        if ([string]::IsNullOrWhiteSpace($value)) { continue }
        [pscustomobject]@{
            DuplicateValue = $value
        }
    }

    return @(
        $rows |
            Group-Object DuplicateValue |
            Where-Object { $_.Count -gt 1 } |
            Sort-Object Count -Descending |
            ForEach-Object {
                $row = [ordered]@{}
                $row[$Label] = $_.Name
                $row["Count"] = $_.Count
                [pscustomobject]$row
            }
    )
}

function Compare-TtPaths {
    param(
        [object[]]$Items,
        [string]$LeftPath,
        [string]$RightPath,
        [string]$LeftLabel = "LeftValue",
        [string]$RightLabel = "RightValue"
    )

    return @(
        $Items | ForEach-Object {
            $left = Convert-TtValue (Get-TtProp -InputObject $_ -Path $LeftPath)
            $right = Convert-TtValue (Get-TtProp -InputObject $_ -Path $RightPath)
            $row = [ordered]@{}
            $row["DisplayName"] = Convert-TtValue (Get-TtProp -InputObject $_ -Path "DisplayName")
            $row["UserPrincipalName"] = Convert-TtValue (Get-TtProp -InputObject $_ -Path "UserPrincipalName")
            $row[$LeftLabel] = $left
            $row[$RightLabel] = $right
            $row["Match"] = ([string]$left -eq [string]$right)
            [pscustomobject]$row
        }
    )
}

function Get-TtCoverageSummary {
    param(
        [object[]]$Items,
        [string]$Path
    )

    $withValue = @(Where-TtHasValue -Items $Items -Path $Path)
    $withoutValue = @(Where-TtMissingValue -Items $Items -Path $Path)

    return @(
        [pscustomobject]@{ Metric = "WithValue"; Count = $withValue.Count }
        [pscustomobject]@{ Metric = "WithoutValue"; Count = $withoutValue.Count }
        [pscustomobject]@{ Metric = "Total"; Count = @($Items).Count }
    )
}

function Write-TtPreview {
    param(
        [object]$Data,
        [int]$Top = 25
    )

    if ($null -eq $Data) {
        Write-Warning "Keine Daten gefunden."
        return
    }

    if ($Data -isnot [System.Collections.IEnumerable] -or $Data -is [string]) {
        @($Data) | Format-List
        return
    }

    $items = @($Data)
    if ($items.Count -eq 0) {
        Write-Warning "Keine Daten gefunden."
        return
    }

    $preview = if ($Top -gt 0) { @($items | Select-Object -First $Top) } else { $items }
    $preview | Format-Table -AutoSize
}

function Export-TtData {
    param(
        [object]$Data,
        [string]$OutputPath
    )

    $directory = Split-Path -Path $OutputPath -Parent
    if ($directory -and -not (Test-Path $directory)) {
        New-Item -Path $directory -ItemType Directory -Force | Out-Null
    }

    $extension = [System.IO.Path]::GetExtension($OutputPath)
    if ($extension -eq ".json") {
        $Data | ConvertTo-Json -Depth 20 | Set-Content -Path $OutputPath -Encoding UTF8
        return
    }

    @($Data) | Export-Csv -Path $OutputPath -NoTypeInformation -Encoding UTF8
}
