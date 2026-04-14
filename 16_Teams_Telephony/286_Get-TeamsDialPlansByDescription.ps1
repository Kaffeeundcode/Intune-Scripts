<#
.SYNOPSIS
    Teams Dial Plans By Description

.DESCRIPTION
    Ruft Teams Dial Plans By Description aus der Teams-Telefonie ab.

.NOTES
    File Name : 286_Get-TeamsDialPlansByDescription.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/286_Get-TeamsDialPlansByDescription.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTenantDialPlan)
$Result = Group-TtByPath -Items $Items -Path "Description" -Label "TeamsDialPlansByDescription"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
