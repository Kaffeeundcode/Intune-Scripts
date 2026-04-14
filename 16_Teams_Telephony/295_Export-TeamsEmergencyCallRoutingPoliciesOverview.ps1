<#
.SYNOPSIS
    Teams Emergency Call Routing Policies Overview

.DESCRIPTION
    Exportiert Teams Emergency Call Routing Policies Overview aus der Teams-Telefonie.

.NOTES
    File Name : 295_Export-TeamsEmergencyCallRoutingPoliciesOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/295_Export-TeamsEmergencyCallRoutingPoliciesOverview.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTeamsEmergencyCallRoutingPolicy)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
