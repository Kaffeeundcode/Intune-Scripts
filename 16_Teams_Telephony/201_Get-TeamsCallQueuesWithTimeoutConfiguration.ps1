<#
.SYNOPSIS
    Teams Call Queues With Timeout Configuration

.DESCRIPTION
    Ruft Teams Call Queues With Timeout Configuration aus der Teams-Telefonie ab.

.NOTES
    File Name : 201_Get-TeamsCallQueuesWithTimeoutConfiguration.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/201_Get-TeamsCallQueuesWithTimeoutConfiguration.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    ResourceAccountCount = "ResourceAccounts.Count"
    AgentCount = "Agents.Count"
    DistributionListCount = "DistributionLists.Count"
    RoutingMethod = "RoutingMethod"
    PresenceBasedRouting = "PresenceBasedRouting"
    ConferenceMode = "ConferenceMode"
    LanguageId = "LanguageId"
})


$Items = @(Get-CsCallQueue)

$Items = Where-TtHasValue -Items $Items -Path "TimeoutAction"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
