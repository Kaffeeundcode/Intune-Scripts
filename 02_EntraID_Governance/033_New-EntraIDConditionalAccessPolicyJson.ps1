<#
.SYNOPSIS
    Exportiert alle Conditional Access Policies als JSON-Dateien (Backup).

.DESCRIPTION
    Sichert die CA-Regelwerke lokal, um sie zu dokumentieren oder wiederherzustellen.
    
    Parameter:
    - OutputFolder: Zielordner (Default: Desktop/CA-Backup)

.NOTES
    File Name: 033_New-EntraIDConditionalAccessPolicyJson.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$OutputFolder = "$HOME/Desktop/CA-Backup"
)

try {
    if (-not (Test-Path $OutputFolder)) { New-Item $OutputFolder -ItemType Directory | Out-Null }
    
    Write-Host "Exportiere CA Policies nach '$OutputFolder'..." -ForegroundColor Cyan

    $Policies = Get-MgIdentityConditionalAccessPolicy -All
    
    foreach ($pol in $Policies) {
        $FileName = "$($pol.DisplayName)" -replace '[\\/*?:"<>|]', "_" # Sanitize Filename
        $Json = $pol | ConvertTo-Json -Depth 10 
        $Json | Out-File "$OutputFolder\$FileName.json" -Encoding UTF8
        Write-Host " - $FileName.json"
    }
    
    Write-Host "Export abgeschlossen ($($Policies.Count) Policies)." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
