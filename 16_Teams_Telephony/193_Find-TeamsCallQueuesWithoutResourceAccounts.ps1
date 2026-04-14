<#
.SYNOPSIS
    Teams Call Queues Without Resource Accounts

.DESCRIPTION
    Identifiziert Teams Call Queues Without Resource Accounts in der Teams-Telefonie.

.NOTES
    File Name : 193_Find-TeamsCallQueuesWithoutResourceAccounts.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/193_Find-TeamsCallQueuesWithoutResourceAccounts.csv",
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

$Items = Where-TtMissingValue -Items $Items -Path "ResourceAccounts.Count"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
