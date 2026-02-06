<#
.SYNOPSIS
    Audit Applications (App Registrations) to find those with no owners or disabled owners.

.DESCRIPTION
    Orphaned apps are a security risk. This script iterates all App Registrations,
    retrieves their owners, and checks if the owner account is Enabled.
    
    Report flags:
    - No Owners
    - Disabled Owner

.NOTES
    File Name  : 120_Get-EntraIDApplicationOwnerAudit.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "Application.Read.All", "User.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Scanning Applications..." -ForegroundColor Cyan
$Apps = Get-MgApplication -All

$Report = @()

foreach ($App in $Apps) {
    try {
        $Owners = Get-MgApplicationOwner -ApplicationId $App.Id -All
        
        if ($Owners.Count -eq 0) {
            $Status = "No Owners"
        } else {
            $Status = "OK"
            # Check for disabled owners
            foreach ($OwnerRef in $Owners) {
                # OwnerRef deals with directory objects
                if ($OwnerRef.AdditionalProperties["@odata.type"] -match "user") {
                     $U = Get-MgUser -UserId $OwnerRef.Id
                     if ($U.AccountEnabled -eq $false) {
                         $Status = "Has Disabled Owner ($($U.DisplayName))"
                     }
                }
            }
        }
    } catch {
        $Status = "Error checking owners"
    }

    if ($Status -ne "OK") {
        $Report += [PSCustomObject]@{
            AppName = $App.DisplayName
            AppId = $App.AppId
            Created = $App.CreatedDateTime
            OwnerStatus = $Status
        }
        Write-Host "Issue found: $($App.DisplayName) -> $Status" -ForegroundColor Red
    }
}

$Report | Format-Table AppName, OwnerStatus -AutoSize
$Path = "$PSScriptRoot\App_Owner_Audit.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
