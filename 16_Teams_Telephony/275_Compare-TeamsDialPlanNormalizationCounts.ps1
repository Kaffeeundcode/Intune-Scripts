<#
.SYNOPSIS
    Teams Dial Plan Normalization Counts

.DESCRIPTION
    Vergleicht Teams Dial Plan Normalization Counts in der Teams-Telefonie.

.NOTES
    File Name : 275_Compare-TeamsDialPlanNormalizationCounts.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/275_Compare-TeamsDialPlanNormalizationCounts.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTenantDialPlan)
$Result = Group-TtByPath -Items $Items -Path "NormalizationRules.Count" -Label "TeamsDialPlanNormalizationCounts"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
