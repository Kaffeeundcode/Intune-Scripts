<#
.SYNOPSIS
    Prüft die globalen Gast-Einstellungen in Teams.

.DESCRIPTION
    Gibt aus, ob Gäste in Teams erlaubt sind und was sie dürfen (Löschen, Editieren etc.).

.NOTES
    File Name: 065_Get-TeamsGuestAccessSettings.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Rufe Teams Client Configuration ab..." -ForegroundColor Cyan
    
    # CsTeamsClientConfiguration steuert viele Gast-Aspekte
    $Config = Get-CsTeamsClientConfiguration
    
    Write-Host "AllowGuestUser:            $($Config.AllowGuestUser)"
    Write-Host "AllowGuestUserToEditMsgs:  $($Config.AllowGuestUserToEditMessage)"
    Write-Host "AllowGuestUserToDeleteMsgs:$($Config.AllowGuestUserToDeleteMessage)"
    
    if ($Config.AllowGuestUser -eq $false) {
        Write-Warning "Gäste sind global in Teams DEAKTIVIERT!"
    } else {
        Write-Host "Gäste sind grundsätzlich erlaubt." -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler (Benötigt MicrosoftTeams): $_"
}
