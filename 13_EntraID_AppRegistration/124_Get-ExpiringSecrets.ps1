<#
.SYNOPSIS
    Findet ablaufende Secrets.
    
.DESCRIPTION
    Durchsucht Apps nach Secrets, die bald ablaufen.
    Erfordert die Berechtigung 'Application.Read.All'.

.NOTES
    File Name: 124_Get-ExpiringSecrets.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Connect-MgGraph -Scopes "Application.Read.All"

$Apps = Get-MgApplication -All 
foreach ($App in $Apps) {
    # PasswordCredentials contains secrets
    foreach ($Cred in $App.PasswordCredentials) {
        if ($Cred.EndDateTime -lt (Get-Date).AddDays(30)) {
            Write-Host "Ablaufendes Secret in App '$($App.DisplayName)' am $($Cred.EndDateTime)" -ForegroundColor Yellow
        }
    }
}
