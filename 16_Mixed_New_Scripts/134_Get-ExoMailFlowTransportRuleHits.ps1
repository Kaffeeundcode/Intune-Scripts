<#
.SYNOPSIS
    Exports Transport Rules and (where possible) analyzes if they are active.

.DESCRIPTION
    Lists all Transport Rules with their priority, state, and actions.
    Note: Exact "Hit Count" is not directly exposed via simple cmdlet, but we can infer
    usage based on Message Trace correlation if needed. 
    This script focuses on the Configuration audit part: Which rules enforce encryption, blocking, etc.

.NOTES
    File Name  : 134_Get-ExoMailFlowTransportRuleHits.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-ExchangeOnline -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

$Rules = Get-TransportRule

$Report = @()

foreach ($Rule in $Rules) {
    $Report += [PSCustomObject]@{
        Name = $Rule.Name
        Priority = $Rule.Priority
        State = $Rule.State
        Mode = $Rule.Mode
        Conditions = ($Rule.Conditions | Out-String).Trim()
        Actions = ($Rule.Actions | Out-String).Trim()
        Created = $Rule.WhenCreated
    }
}

$Report | Sort-Object Priority | Format-Table Name, Priority, State, Mode -AutoSize
$Report | Export-Csv "$PSScriptRoot\Transport_Rule_Audit.csv" -NoTypeInformation
Write-Host "Exported." -ForegroundColor Green
