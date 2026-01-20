<#
.SYNOPSIS
    Prüft, ob eine Applikation in einer veralteten Version installiert ist.
    (Intune Detection Script)

.DESCRIPTION
    Verleicht DisplayVersion aus der Registry mit einer Mindestversion.

    Parameter:
    - AppName: Name der Anwendung (Wildcard Match)
    - MinVersion: Mindestversion (z.B. 1.0.5)

.NOTES
    File Name: 051_Detect-OldAppVersion.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$AppName,
    [Parameter(Mandatory=$true)] [version]$MinVersion
)

try {
    # Suche in Uninstall Keys (32 und 64 bit)
    $Paths = @("HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*", "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*")
    
    $Installed = Get-ItemProperty -Path $Paths -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*$AppName*" }

    if (-not $Installed) {
        Write-Host "App '$AppName' nicht gefunden."
        exit 0 # Oder 1, je nach Logik. Hier: Ignorieren.
    }

    $CurrentVersion = [version]$Installed.DisplayVersion
    
    if ($CurrentVersion -lt $MinVersion) {
        Write-Host "NonCompliant (Ist: $CurrentVersion, Soll: $MinVersion)"
        exit 1
    } else {
        Write-Host "Compliant"
        exit 0
    }

} catch {
    Write-Error "Fehler (evtl. Version Parse Error): $_"
    exit 1
}
