<#
.SYNOPSIS
    Prüft einen spezifischen Registry-Wert auf Compliance.
    (Intune Detection Script)

.DESCRIPTION
    Vergleicht Ist-Wert mit Soll-Wert.

    Parameter:
    - Path: Registry Pfad (HKLM:\...)
    - Name: Value Name
    - ExpectedValue: Erwarteter Wert

.NOTES
    File Name: 057_Detect-RegistryValue.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$Path,
    [Parameter(Mandatory=$true)] [string]$Name,
    [Parameter(Mandatory=$true)] [string]$ExpectedValue
)

try {
    $Current = Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue
    
    if (-not $Current) {
        Write-Host "NonCompliant (Value fehlt)"
        exit 1
    }

    if ($Current.$Name -eq $ExpectedValue) {
        Write-Host "Compliant"
        exit 0
    } else {
        Write-Host "NonCompliant (Ist: $($Current.$Name))"
        exit 1
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
