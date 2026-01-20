<#
.SYNOPSIS
    Setzt einen Registry-Wert.
    (Intune Remediation Script)

.DESCRIPTION
    Erstellt den Key falls nötig und setzt den Wert.

    Parameter:
    - Path: Registry Pfad
    - Name: Value Name
    - Value: Der zu setzende Wert
    - Type: PropertyType (String, DWord etc.) - Default: String

.NOTES
    File Name: 058_Remediate-SetRegistryValue.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$Path,
    [Parameter(Mandatory=$true)] [string]$Name,
    [Parameter(Mandatory=$true)] [string]$Value,
    [Parameter(Mandatory=$false)] [string]$Type = "String"
)

try {
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }

    Set-ItemProperty -Path $Path -Name $Name -Value $Value -Type $Type -Force -ErrorAction Stop
    Write-Host "Registry Wert gesetzt."

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
