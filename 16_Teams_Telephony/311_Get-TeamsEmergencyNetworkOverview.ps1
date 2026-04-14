<#
.SYNOPSIS
    Teams Emergency Network Overview

.DESCRIPTION
    Ruft Teams Emergency Network Overview aus der Teams-Telefonie ab.

.NOTES
    File Name : 311_Get-TeamsEmergencyNetworkOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/311_Get-TeamsEmergencyNetworkOverview.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantNetworkSite", "Get-CsTenantNetworkSubnet", "Get-CsOnlineLisLocation")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTenantNetworkSubnet)


$Result = @(
    [pscustomobject]@{ Metric = "NetworkSites"; Count = (@(Get-CsTenantNetworkSite)).Count }
    [pscustomobject]@{ Metric = "NetworkSubnets"; Count = (@(Get-CsTenantNetworkSubnet)).Count }
    [pscustomobject]@{ Metric = "LisLocations"; Count = (@(Get-CsOnlineLisLocation)).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
