<#
.SYNOPSIS
    Triggered ein Azure Automation Runbook per Webhook.

.DESCRIPTION
    Ideal, um Runbooks von extern (z.B. Monitoring Tool, lokales Skript) zu starten.
    Startet den Webhook POST Request.

    Parameter:
    - WebhookUrl: Die geheime URL des Webhooks.
    - Data: (Optional) JSON Payload für das Runbook.

.NOTES
    File Name: 090_Invoke-AzRunbookWebhook.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$WebhookUrl,
    [Parameter(Mandatory=$false)] [object]$Data
)

try {
    Write-Host "Sende Webhook Request..." -ForegroundColor Cyan

    $Body = $null
    if ($Data) {
        $Body = $Data | ConvertTo-Json -Depth 5 -Compress
    }

    $Response = Invoke-RestMethod -Method Post -Uri $WebhookUrl -Body $Body -ErrorAction Stop
    
    Write-Host "Webhook getriggert. Job ID: $($Response.JobIds[0])" -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
