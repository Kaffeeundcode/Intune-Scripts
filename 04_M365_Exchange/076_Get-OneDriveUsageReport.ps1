<#
.SYNOPSIS
    Report über OneDrive Nutzung (Storage, File Count).

.DESCRIPTION
    Nutzt Graph API Report "getOneDriveUsageUserDetail".
    Zeigt, wer wie viel Speicher in OneDrive for Business belegt.

    Parameter:
    - Period: D7, D30, D90 (Default: D30)

.NOTES
    File Name: 076_Get-OneDriveUsageReport.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$Period = "D30"
)

try {
    Write-Host "Rufe OneDrive Usage ($Period) ab..." -ForegroundColor Cyan

    $Url = "https://graph.microsoft.com/v1.0/reports/getOneDriveUsageUserDetail(period='$Period')"
    
    $TempFile = New-TemporaryFile
    Invoke-MgGraphRequest -Method GET -Uri $Url -OutputFilePath $TempFile.FullName -ErrorAction Stop

    $Data = Import-Csv $TempFile.FullName
    
    $Data | Select-Object "Owner Principal Name", "Storage Used (Byte)", "File Count", "Active File Count" | 
            Sort-Object {[long]$_."Storage Used (Byte)"} -Descending | 
            Format-Table -AutoSize

    Remove-Item $TempFile.FullName -Force

} catch {
    Write-Error "Fehler: $_"
}
