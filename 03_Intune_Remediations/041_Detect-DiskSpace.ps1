<#
.SYNOPSIS
    Erkennt, ob der freie Speicherplatz auf C: unter einem Schwellenwert liegt.
    (Intune Detection Script)

.DESCRIPTION
    Ausgabe "NonCompliant", wenn Speicher < Threshold. 
    Sonst "Compliant".

    Parameter:
    - ThresholdPercent: Warnschwelle in % (Default: 10)

.NOTES
    File Name: 041_Detect-DiskSpace.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [int]$ThresholdPercent = 10
)

try {
    $Disk = Get-Volume -DriveLetter C -ErrorAction Stop
    $Free = [math]::Round(($Disk.SizeRemaining / $Disk.Size) * 100, 2)
    
    if ($Free -lt $ThresholdPercent) {
        Write-Host "NonCompliant"
        exit 1 # Intune wertet Exit Code 1 als "Fehler/Gefunden" für Remediation
    } else {
        Write-Host "Compliant"
        exit 0
    }

} catch {
    Write-Error "Fehler: $_"
    exit 1
}
