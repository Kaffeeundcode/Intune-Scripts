<#
.SYNOPSIS
    Entfernt "Disconnected" (gelöschte) Mailboxen endgültig.

.DESCRIPTION
    Nach dem Löschen eines Users bleibt die Mailbox soft-deleted.
    Dieses Skript bereinigt diese sofort (Purge).
    VORSICHT: Daten sind dann weg!

.NOTES
    File Name: 068_Remove-ExoDisconnectedMailboxes.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

try {
    Write-Host "Suche Soft-Deleted Mailboxes..." -ForegroundColor Cyan
    
    $SoftDeleted = Get-Mailbox -SoftDeletedMailbox -ResultSize Unlimited
    
    if ($SoftDeleted.Count -eq 0) {
        Write-Host "Keine Soft-Deleted Mailboxen gefunden." -ForegroundColor Green
        exit
    }
    
    Write-Warning "Gefunden: $($SoftDeleted.Count)"
    $SoftDeleted | Select-Object DisplayName, ExchangeGuid, PrimarySmtpAddress

    Write-Host "Um diese endgültig zu löschen, führen Sie folgenden Befehl pro Mailbox aus:"
    Write-Host "Remove-Mailbox -Identity <ExchangeGuid> -PermanentlyDelete" -ForegroundColor Yellow
    
    # Automatische Löschung hier bewusst auskommentiert zur Sicherheit:
    # foreach ($mb in $SoftDeleted) { Remove-Mailbox -Identity $mb.ExchangeGuid -PermanentlyDelete }

} catch {
    Write-Error "Fehler: $_"
}
