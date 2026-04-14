<#
.SYNOPSIS
    Teams Emergency Policies And Network Sites

.DESCRIPTION
    Vergleicht Teams Emergency Policies And Network Sites in der Teams-Telefonie.

.NOTES
    File Name : 306_Compare-TeamsEmergencyPoliciesAndNetworkSites.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/306_Compare-TeamsEmergencyPoliciesAndNetworkSites.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallingPolicy", "Get-CsTeamsEmergencyCallRoutingPolicy", "Get-CsTenantNetworkSite", "Get-CsTenantNetworkSubnet")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTenantNetworkSite)


$Result = @(
    [pscustomobject]@{ Metric = "EmergencyCallingPolicies"; Count = (@(Get-CsTeamsEmergencyCallingPolicy)).Count }
    [pscustomobject]@{ Metric = "EmergencyRoutingPolicies"; Count = (@(Get-CsTeamsEmergencyCallRoutingPolicy)).Count }
    [pscustomobject]@{ Metric = "NetworkSites"; Count = (@(Get-CsTenantNetworkSite)).Count }
    [pscustomobject]@{ Metric = "NetworkSubnets"; Count = (@(Get-CsTenantNetworkSubnet)).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
