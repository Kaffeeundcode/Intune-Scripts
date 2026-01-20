<#
.SYNOPSIS
    Zeigt die häufigsten Anmeldefehler der letzten 24 Stunden.

.DESCRIPTION
    Aggregiert Fehlercodes aus den Sign-In Logs, um Probleme (oder Angriffe) zu erkennen.
    Top 10 Fehlerursachen.

.NOTES
    File Name: 037_Get-EntraIDAuditLogRecentFailures.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Analysiere Sign-In Logs der letzten 24h..." -ForegroundColor Cyan

    $Time = (Get-Date).AddHours(-24).ToString("yyyy-MM-ddTHH:mm:ssZ")
    
    # Filtern auf Fehler (Status.ErrorCode != 0)
    $Logs = Get-MgAuditLogSignIn -Filter "createdDateTime ge $Time and status/errorCode ne 0" -All -ErrorAction SilentlyContinue

    if ($Logs) {
        Write-Host "Gefundene Fehler: $($Logs.Count)" -ForegroundColor Yellow
        
        $Logs | Group-Object -Property {$_.Status.FailureReason} | Sort-Object Count -Descending | Select-Object Count, Name | Format-Table -AutoSize
    } else {
        Write-Host "Keine Anmeldefehler in den letzten 24h gefunden." -ForegroundColor Green
    }

} catch {
    Write-Error "Fehler (Benötigt AuditLog.Read.All): $_"
}
