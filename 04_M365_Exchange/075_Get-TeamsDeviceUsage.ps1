<#
.SYNOPSIS
    Report über in Teams verwendete Geräte (Windows, Mac, iOS, Android).

.DESCRIPTION
    Basiert auf Microsoft Graph "getTeamsDeviceUsageUserDetail".
    Zeigt, wer mit welchem Gerätetyp Teams nutzt.

    Parameter:
    - Period: D7, D30, D90, D180 (Default: D30)

.NOTES
    File Name: 075_Get-TeamsDeviceUsage.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$Period = "D30"
)

try {
    Write-Host "Rufe Teams Device Usage ($Period) ab..." -ForegroundColor Cyan

    $Url = "https://graph.microsoft.com/v1.0/reports/getTeamsDeviceUsageUserDetail(period='$Period')"
    # Report API gibt CSV zurück, nicht JSON!
    
    $TempFile = New-TemporaryFile
    Invoke-MgGraphRequest -Method GET -Uri $Url -OutputFilePath $TempFile.FullName -ErrorAction Stop

    # CSV importieren
    $Data = Import-Csv $TempFile.FullName
    
    $Data | Select-Object "User Principal Name", "Used Web", "Used Windows Phone", "Used iOS", "Used Mac", "Used Android", "Used Windows" | Format-Table -AutoSize

    Remove-Item $TempFile.FullName -Force

} catch {
    Write-Error "Fehler: $_"
}
