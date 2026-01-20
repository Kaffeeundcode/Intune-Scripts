<#
.SYNOPSIS
    Listet alle Action Groups (Alarm-Empfänger) auf.

.DESCRIPTION
    Zeigt, wer benachrichtigt wird (Email, SMS, Webhook), wenn ein Alert feuert.
    
    Parameter:
    - ResourceGroupName: (Optional)

.NOTES
    File Name: 093_Get-AzMonitorActionGroup.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$ResourceGroupName
)

try {
    $Groups = if ($ResourceGroupName) { Get-AzActionGroup -ResourceGroupName $ResourceGroupName } else { Get-AzActionGroup }

    foreach ($g in $Groups) {
        Write-Host "Action Group: $($g.GroupShortName) ($($g.Enabled))" -ForegroundColor Yellow
        
        foreach ($r in $g.EmailReceivers) { Write-Host " - Email: $($r.EmailAddress)" }
        foreach ($s in $g.SmsReceivers)   { Write-Host " - SMS:   $($s.PhoneNumber)" }
        foreach ($w in $g.WebhookReceivers){ Write-Host " - Hook:  $($w.ServiceUri)" }
    }

} catch {
    Write-Error "Fehler: $_"
}
