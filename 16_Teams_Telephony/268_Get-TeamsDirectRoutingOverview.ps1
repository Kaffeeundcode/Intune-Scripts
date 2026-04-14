<#
.SYNOPSIS
    Teams Direct Routing Overview

.DESCRIPTION
    Ruft Teams Direct Routing Overview aus der Teams-Telefonie ab.

.NOTES
    File Name : 268_Get-TeamsDirectRoutingOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/268_Get-TeamsDirectRoutingOverview.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlinePSTNGateway", "Get-CsVoiceRoute", "Get-CsOnlineVoiceRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsVoiceRoute)


$gateways = @(Get-CsOnlinePSTNGateway)
$routes = @(Get-CsVoiceRoute)
$policies = @(Get-CsOnlineVoiceRoutingPolicy)
$Result = @(
    [pscustomobject]@{ Metric = "GatewaysEnabled"; Count = (@($gateways | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "Enabled") })).Count }
    [pscustomobject]@{ Metric = "GatewaysDisabled"; Count = (@($gateways | Where-Object { -not [bool](Get-TtProp -InputObject $_ -Path "Enabled") })).Count }
    [pscustomobject]@{ Metric = "VoiceRoutes"; Count = $routes.Count }
    [pscustomobject]@{ Metric = "VoiceRoutingPolicies"; Count = $policies.Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
