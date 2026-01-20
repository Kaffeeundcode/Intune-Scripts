<#
.SYNOPSIS
    Erstellt einen Bericht über gesendete/empfangene E-Mails pro Tag.

.DESCRIPTION
    Hilft, das Mailaufkommen zu analysieren.
    Nutzt Get-MailTrafficSummaryReport (Exchange Online).

    Parameter:
    - Days: Betrachtungszeitraum (Default: 7)

.NOTES
    File Name: 071_Get-ExoMailTrafficReport.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [int]$Days = 7
)

try {
    $StartDate = (Get-Date).AddDays(-$Days)
    Write-Host "Rufe Mail Traffic Report ab (seit $StartDate)..." -ForegroundColor Cyan

    $Report = Get-MailTrafficReport -StartDate $StartDate -EndDate (Get-Date) -EventTypes GoodMail,Spam,Malware -ErrorAction SilentlyContinue

    if ($Report) {
        $Report | Select-Object Date, EventType, Direction, MessageCount | Sort-Object Date | Format-Table -AutoSize
    } else {
        Write-Warning "Keine Traffic-Daten verfügbar (Kann bis zu 24h Verzögerung haben)."
    }

} catch {
    Write-Error "Fehler: $_"
}
