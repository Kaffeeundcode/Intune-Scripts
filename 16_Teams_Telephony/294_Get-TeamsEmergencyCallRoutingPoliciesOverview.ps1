<#
.SYNOPSIS
    Teams Emergency Call Routing Policies Overview

.DESCRIPTION
    Ruft Teams Emergency Call Routing Policies Overview aus der Teams-Telefonie ab.

.NOTES
    File Name : 294_Get-TeamsEmergencyCallRoutingPoliciesOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/294_Get-TeamsEmergencyCallRoutingPoliciesOverview.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    Description = "Description"
})


$Items = @(Get-CsTeamsEmergencyCallRoutingPolicy)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
