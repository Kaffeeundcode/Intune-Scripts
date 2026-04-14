<#
.SYNOPSIS
    Teams Emergency Routing Overview

.DESCRIPTION
    Ruft Teams Emergency Routing Overview aus der Teams-Telefonie ab.

.NOTES
    File Name : 310_Get-TeamsEmergencyRoutingOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/310_Get-TeamsEmergencyRoutingOverview.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallingPolicy", "Get-CsTeamsEmergencyCallRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTeamsEmergencyCallRoutingPolicy)


$Result = @(
    [pscustomobject]@{ Metric = "EmergencyCallingPolicies"; Count = (@(Get-CsTeamsEmergencyCallingPolicy)).Count }
    [pscustomobject]@{ Metric = "EmergencyRoutingPolicies"; Count = (@(Get-CsTeamsEmergencyCallRoutingPolicy)).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
