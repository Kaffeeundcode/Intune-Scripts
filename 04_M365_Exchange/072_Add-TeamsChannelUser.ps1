<#
.SYNOPSIS
    Fügt einem Private Channel in Teams einen Benutzer hinzu.

.DESCRIPTION
    <!-- library-status:start -->
    Prüfstatus: Ungeprüft
    Windows- und Tenant-Abnahme ausstehend; keine pauschale Produktionsfreigabe.

    <!-- library-status:end -->

    Private Channels haben eigene Mitgliederlisten.
    Dieses Skript fügt User hinzu.

    Parameter:
    - GroupId: Team ID
    - ChannelName: Kanal Name
    - UserEmail: User UPN
    - Role: Owner oder Member

.NOTES
    File Name: 072_Add-TeamsChannelUser.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$GroupId,
    [Parameter(Mandatory=$true)] [string]$ChannelName,
    [Parameter(Mandatory=$true)] [string]$UserEmail,
    [Parameter(Mandatory=$false)] [string]$Role = "Member"
)

try {
    Write-Host "Füge '$UserEmail' zu Channel '$ChannelName' hinzu..." -ForegroundColor Cyan

    Add-TeamChannelUser -GroupId $GroupId -DisplayName $ChannelName -User $UserEmail -Role $Role -ErrorAction Stop

    Write-Host "Benutzer hinzugefügt." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
