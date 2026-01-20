<#
.SYNOPSIS
    Erstellt Diagnostic Settings für eine Ressource (Logs an Log Analytics senden).

.DESCRIPTION
    Aktiviert das Senden von Logs und Metriken an einen Log Analytics Workspace.
    
    Parameter:
    - ResourceId: ID der Zielressource (z.B. KeyVault, NIC, LB)
    - WorkspaceId: ID des Log Analytics Workspace
    - SettingName: Name des Settings (Default: 'Send-To-Laws')

.NOTES
    File Name: 018_Set-AzDiagnositcSettingTemplate.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceId,
    [Parameter(Mandatory=$true)] [string]$WorkspaceId,
    [Parameter(Mandatory=$false)] [string]$SettingName = "Send-To-Laws"
)

try {
    Write-Host "Konfiguriere Diagnostic Settings für Ressource..." -ForegroundColor Cyan
    
    Set-AzDiagnosticSetting -ResourceId $ResourceId `
                            -WorkspaceId $WorkspaceId `
                            -Name $SettingName `
                            -Enabled $true `
                            -ErrorAction Stop | Out-Null
                            
    Write-Host "Diagnostic Setting '$SettingName' wurde erfolgreich aktiviert." -ForegroundColor Green
    Write-Host "Ziel: Workspace '$WorkspaceId'"

} catch {
    Write-Error "Fehler: $_"
}
