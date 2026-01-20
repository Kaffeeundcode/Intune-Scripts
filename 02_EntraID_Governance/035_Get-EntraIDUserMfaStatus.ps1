<#
.SYNOPSIS
    Report über registrierte MFA-Methoden pro Benutzer (nur Legacy/Per-User MFA Status).

.DESCRIPTION
    Zeigt an, ob MFA "Enabled" oder "Enforced" ist (Legacy Portal Einstellung).
    Für modernes Authentication Methods Reporting (Graph) wird ein anderes Cmdlet benötigt, welches komplexer ist.
    Dies hier ist für den schnellen Überblick über den "alten" Status hilfreich.

.NOTES
    File Name: 035_Get-EntraIDUserMfaStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Rufe Legacy MFA Status via MSOnline (deprecated) oder Workaround ab..." -ForegroundColor Cyan
    Write-Warning "Hinweis: Dieser Status betrifft nur 'Per-User MFA'. Conditional Access wird hier nicht angezeigt!"

    # Da MSOnline deprecated ist, nutzen wir Graph User Properties, allerdings ist 'strongAuthenticationRequirements' property nicht immer gefüllt in v1.0
    # Alternativ Beta:
    
    $Users = Get-MgBetaUser -All -Property UserPrincipalName, StrongAuthenticationRequirements, DisplayName

    $Results = foreach ($u in $Users) {
        $State = "Disabled"
        if ($u.StrongAuthenticationRequirements) {
            $State = $u.StrongAuthenticationRequirements.State
        }
        
        [PSCustomObject]@{
            User = $u.UserPrincipalName
            MFA_Legacy_State = $State
        }
    }
    
    $Results | Where-Object MFA_Legacy_State -ne "Disabled" | Format-Table

} catch {
    Write-Error "Fehler: $_"
}
