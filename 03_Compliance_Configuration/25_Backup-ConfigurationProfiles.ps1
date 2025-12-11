<#
.SYNOPSIS
    Backs up all Configuration Profiles to JSON files.
    
.DESCRIPTION
    Exports each profile to a .json file in a 'Backup' subdirectory.
    Requires 'DeviceManagementConfiguration.Read.All' permission.

.NOTES
    File Name: 25_Backup-ConfigurationProfiles.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$DestinationPath = ".\Backup"
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

if (-not (Test-Path $DestinationPath)) { New-Item -ItemType Directory -Path $DestinationPath | Out-Null }

$Profiles = Get-MgDeviceManagementDeviceConfiguration -All

foreach ($P in $Profiles) {
    $FileName = "$($P.DisplayName) - $($P.Id).json" -replace '[\\/*?:"<>|]', '' # Sanitize filename
    $FilePath = Join-Path $DestinationPath $FileName
    
    $P | ConvertTo-Json -Depth 10 | Out-File $FilePath
    Write-Host "Exported: $($P.DisplayName)"
}
Write-Host "Backup complete in '$DestinationPath'." -ForegroundColor Green
