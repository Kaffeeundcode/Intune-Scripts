<#
.SYNOPSIS
    Teams Call Queues With Presence Routing

.DESCRIPTION
    Ruft Teams Call Queues With Presence Routing aus der Teams-Telefonie ab.

.NOTES
    File Name : 197_Get-TeamsCallQueuesWithPresenceRouting.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/197_Get-TeamsCallQueuesWithPresenceRouting.csv",
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

$Items = $Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "PresenceBasedRouting") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
