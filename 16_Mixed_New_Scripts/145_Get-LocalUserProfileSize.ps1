<#
.SYNOPSIS
    Calculates the size of User Profiles on the local machine.

.DESCRIPTION
    Useful for shared devices to identify space hogs.
    Iterates C:\Users and calculates folder size.
    Warning: Slow on large drives.

.NOTES
    File Name  : 145_Get-LocalUserProfileSize.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

$Profiles = Get-ChildItem "C:\Users" -Directory

$Report = @()

foreach ($P in $Profiles) {
    Write-Host "Measuring $($P.Name)..." -NoNewline
    try {
        $Size = Get-ChildItem $P.FullName -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum
        $MB = [math]::Round($Size.Sum / 1MB, 2)
        
        $Report += [PSCustomObject]@{
            Profile = $P.Name
            SizeMB = $MB
            LastWrite = $P.LastWriteTime
        }
        Write-Host " $MB MB" -ForegroundColor Green
    } catch {
        Write-Host " Error" -ForegroundColor Red
    }
}

$Report | Sort-Object SizeMB -Descending | Format-Table Profile, SizeMB -AutoSize
