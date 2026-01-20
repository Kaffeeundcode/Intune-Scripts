<#
.SYNOPSIS
    Erstellt ein neues Custom Event Grid Topic.

.DESCRIPTION
    Event Grid ermöglicht ereignisbasierte Architekturen.
    
    Parameter:
    - ResourceGroupName: RG Name
    - TopicName: Name des Topics
    - Location: Region

.NOTES
    File Name: 087_New-AzEventGridTopic.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$TopicName,
    [Parameter(Mandatory=$true)] [string]$Location
)

try {
    Write-Host "Erstelle Event Grid Topic '$TopicName'..." -ForegroundColor Cyan

    New-AzEventGridTopic -ResourceGroupName $ResourceGroupName -Name $TopicName -Location $Location -ErrorAction Stop

    Write-Host "Topic erfolgreich erstellt." -ForegroundColor Green
    Write-Host "Endpoint und Keys können nun abgerufen werden."

} catch {
    Write-Error "Fehler: $_"
}
