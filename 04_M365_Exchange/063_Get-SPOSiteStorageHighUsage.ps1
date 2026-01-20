<#
.SYNOPSIS
    Listet SharePoint Sites auf, deren Speicher fast voll ist.

.DESCRIPTION
    Prüft alle Site Collections und berechnet die Auslastung.
    Benötigt SharePoint Online Management Shell.

    Parameter:
    - WarnPercent: Warnschwelle in % (Default: 90)

.NOTES
    File Name: 063_Get-SPOSiteStorageHighUsage.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$WarnPercent = 90
)

try {
    Write-Host "Analysiere SPO Storage..." -ForegroundColor Cyan

    $Sites = Get-SPOSite -Limit All 
    
    foreach ($s in $Sites) {
        if ($s.StorageQuota -gt 0) {
            $Percent = [math]::Round(($s.StorageUsageCurrent / $s.StorageQuota) * 100, 2)
            
            if ($Percent -ge $WarnPercent) {
                Write-Warning "Site: $($s.Url) ist zu $Percent % voll ($($s.StorageUsageCurrent) MB von $($s.StorageQuota) MB)"
            }
        }
    }
    
    Write-Host "Prüfung beendet." -ForegroundColor Green

} catch {
    Write-Error "Fehler (Benötigt Connect-SPOService): $_"
}
