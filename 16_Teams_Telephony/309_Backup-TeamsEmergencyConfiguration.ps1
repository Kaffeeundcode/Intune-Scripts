<#
.SYNOPSIS
    Teams Emergency Configuration

.DESCRIPTION
    Sichert Teams Emergency Configuration aus der Teams-Telefonie.

.NOTES
    File Name : 309_Backup-TeamsEmergencyConfiguration.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/309_Backup-TeamsEmergencyConfiguration.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallingPolicy", "Get-CsTeamsEmergencyCallRoutingPolicy", "Get-CsOnlineLisLocation", "Get-CsOnlineLisCivicAddress", "Get-CsTenantNetworkSite", "Get-CsTenantNetworkSubnet")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineLisCivicAddress)


$Result = [ordered]@{
    EmergencyCallingPolicies = @(Get-CsTeamsEmergencyCallingPolicy)
    EmergencyRoutingPolicies = @(Get-CsTeamsEmergencyCallRoutingPolicy)
    LisLocations = @(Get-CsOnlineLisLocation)
    LisCivicAddresses = @(Get-CsOnlineLisCivicAddress)
    NetworkSites = @(Get-CsTenantNetworkSite)
    NetworkSubnets = @(Get-CsTenantNetworkSubnet)
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
