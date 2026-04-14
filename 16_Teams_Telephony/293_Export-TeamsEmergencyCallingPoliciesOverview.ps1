<#
.SYNOPSIS
    Teams Emergency Calling Policies Overview

.DESCRIPTION
    Exportiert Teams Emergency Calling Policies Overview aus der Teams-Telefonie.

.NOTES
    File Name : 293_Export-TeamsEmergencyCallingPoliciesOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/293_Export-TeamsEmergencyCallingPoliciesOverview.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTeamsEmergencyCallingPolicy)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
