<#
.SYNOPSIS
    Teams Dial Plan Complexity

.DESCRIPTION
    Misst Teams Dial Plan Complexity in der Teams-Telefonie.

.NOTES
    File Name : 280_Measure-TeamsDialPlanComplexity.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/280_Measure-TeamsDialPlanComplexity.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTenantDialPlan)
$Result = Group-TtByPath -Items $Items -Path "NormalizationRules.Count" -Label "TeamsDialPlanComplexity"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
