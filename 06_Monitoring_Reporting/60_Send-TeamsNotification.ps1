<#
.SYNOPSIS
    Sendet eine Teams-Benachrichtigung (via Webhook).
    
.DESCRIPTION
    Sendet JSON Payload an einen Incoming Webhook. Nützlich für Alerts aus Skripten.
    
.NOTES
    File Name: 60_Send-TeamsNotification.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$WebhookUrl,
    [string]$Title,
    [string]$Message,
    [string]$Color = "FF0000"
)

$Payload = @{
    "@type" = "MessageCard"
    "@context" = "http://schema.org/extensions"
    themeColor = $Color
    summary = $Title
    sections = @(
        @{
            activityTitle = $Title
            activitySubtitle = "Intune Alert"
            text = $Message
        }
    )
}

Invoke-RestMethod -Uri $WebhookUrl -Method Post -Body ($Payload | ConvertTo-Json -Depth 5) -ContentType 'application/json'
