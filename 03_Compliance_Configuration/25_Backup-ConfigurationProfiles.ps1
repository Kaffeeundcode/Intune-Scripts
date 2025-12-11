<#
.SYNOPSIS
    Erstellt ein Backup (JSON Export) aller Konfigurationsprofile.
    
.DESCRIPTION
    Exportiert die Definition jedes Profils als JSON-Datei in einen lokalen Ordner.
    Nützlich für Disaster Recovery oder Dokumentation.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.Read.All'.

.NOTES
    File Name: 25_Backup-ConfigurationProfiles.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$ExportPath = "$HOME/Desktop/IntuneBackups"
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.Read.All"

if (!(Test-Path $ExportPath)) { New-Item -ItemType Directory -Path $ExportPath | Out-Null }

$Profiles = Get-MgDeviceManagementDeviceConfiguration -All

foreach ($Profile in $Profiles) {
    $SafeName = $Profile.DisplayName -replace '[\\/:*?"<>|]', ''
    $Json = $Profile | ConvertTo-Json -Depth 5
    $File = Join-Path $ExportPath "$SafeName.json"
    $Json | Set-Content $File
    Write-Host "Exportiert: $SafeName"
}

Write-Host "Backup abgeschlossen in $ExportPath" -ForegroundColor Green
