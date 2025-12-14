<#
.SYNOPSIS
    Pausiert/Startet die Verarbeitung einer dynamischen Gruppe.
    
.DESCRIPTION
    Kann genutzt werden, um das ProcessingState neu zu triggern (wenn unterstützt).
    Hinweis: Direktes 'Validate' ist nur via UI einfach, hier prüfen wir den Status.
    Erfordert die Berechtigung 'Group.ReadWrite.All'.

.NOTES
    File Name: 112_Validate-DynamicGroup.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$GroupName
)

Connect-MgGraph -Scopes "Group.ReadWrite.All"

$Group = Get-MgGroup -Filter "displayName eq '$GroupName'"
if ($Group) {
    # Pause/Resume via processing state update is restricted.
    # To re-trigger, often a whitespace change in rule is used as a trick.
    Write-Host "Aktueller Status: $($Group.MembershipRuleProcessingState)"
    Write-Warning "Tipp: Um eine Neuberechnung zu erzwingen, ändern Sie die Regel minimal."
}
