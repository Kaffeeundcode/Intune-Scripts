<#
.SYNOPSIS
    Teams Dial Plan Normalization Rule Summary

.DESCRIPTION
    Ruft Teams Dial Plan Normalization Rule Summary aus der Teams-Telefonie ab.

.NOTES
    File Name : 277_Get-TeamsDialPlanNormalizationRuleSummary.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/277_Get-TeamsDialPlanNormalizationRuleSummary.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    NormalizationRuleCount = "NormalizationRules.Count"
})


$Items = @(Get-CsTenantDialPlan)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
