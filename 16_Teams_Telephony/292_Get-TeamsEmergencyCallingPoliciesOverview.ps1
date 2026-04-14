<#
.SYNOPSIS
    Teams Emergency Calling Policies Overview

.DESCRIPTION
    Ruft Teams Emergency Calling Policies Overview aus der Teams-Telefonie ab.

.NOTES
    File Name : 292_Get-TeamsEmergencyCallingPoliciesOverview.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/292_Get-TeamsEmergencyCallingPoliciesOverview.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTeamsEmergencyCallingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    Description = "Description"
})


$Items = @(Get-CsTeamsEmergencyCallingPolicy)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
