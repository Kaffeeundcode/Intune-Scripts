<#
.SYNOPSIS
    Teams Emergency Calling Policies

.DESCRIPTION
    Exportiert Teams Emergency Calling Policies aus der Teams-Telefonie.

.NOTES
    File Name : 186_Export-TeamsEmergencyCallingPolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/186_Export-TeamsEmergencyCallingPolicies.json",
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
