<#
.SYNOPSIS
    Teams Tenant Dial Plan Summary

.DESCRIPTION
    Ruft Teams Tenant Dial Plan Summary aus der Teams-Telefonie ab.

.NOTES
    File Name : 291_Get-TeamsTenantDialPlanSummary.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/291_Get-TeamsTenantDialPlanSummary.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTenantDialPlan)


$Result = @(
    [pscustomobject]@{ Metric = "DialPlans"; Count = $Items.Count }
    [pscustomobject]@{ Metric = "DialPlansWithNormalizationRules"; Count = (@($Items | Where-Object { Get-TtProp -InputObject $_ -Path "NormalizationRules.Count" })).Count }
    [pscustomobject]@{ Metric = "DialPlansWithPstnUsage"; Count = (@($Items | Where-Object { Get-TtProp -InputObject $_ -Path "PstnUsages.Count" })).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
