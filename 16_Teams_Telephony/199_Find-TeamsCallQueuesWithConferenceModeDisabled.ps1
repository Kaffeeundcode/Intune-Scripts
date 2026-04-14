<#
.SYNOPSIS
    Teams Call Queues With Conference Mode Disabled

.DESCRIPTION
    Identifiziert Teams Call Queues With Conference Mode Disabled in der Teams-Telefonie.

.NOTES
    File Name : 199_Find-TeamsCallQueuesWithConferenceModeDisabled.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/199_Find-TeamsCallQueuesWithConferenceModeDisabled.csv",
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

$Items = $Items | Where-Object { -not [bool](Get-TtProp -InputObject $_ -Path "ConferenceMode") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
