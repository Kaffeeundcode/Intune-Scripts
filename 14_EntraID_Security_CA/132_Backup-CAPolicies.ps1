<#
.SYNOPSIS
    Backup aller CA Policies (JSON).
    
.DESCRIPTION
    Exportiert jede Policy als JSON.
    Erfordert die Berechtigung 'Policy.Read.All'.

.NOTES
    File Name: 132_Backup-CAPolicies.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$Path = "$HOME/Desktop/CABackup"
)

Connect-MgGraph -Scopes "Policy.Read.All"

if (!(Test-Path $Path)) { New-Item -ItemType Directory -Path $Path | Out-Null }

$Policies = Get-MgIdentityConditionalAccessPolicy
foreach ($P in $Policies) {
    $Name = $P.DisplayName -replace '[\\/:*?"<>|]', ''
    $P | ConvertTo-Json -Depth 10 | Set-Content "$Path\$Name.json"
}
Write-Host "Backup erstellt."
