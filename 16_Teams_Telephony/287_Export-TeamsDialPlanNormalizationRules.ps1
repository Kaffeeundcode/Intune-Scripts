<#
.SYNOPSIS
    Teams Dial Plan Normalization Rules

.DESCRIPTION
    Exportiert Teams Dial Plan Normalization Rules aus der Teams-Telefonie.

.NOTES
    File Name : 287_Export-TeamsDialPlanNormalizationRules.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/287_Export-TeamsDialPlanNormalizationRules.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTenantDialPlan)


$Result = foreach ($plan in $Items) {
    $rules = @(Get-TtProp -InputObject $plan -Path "NormalizationRules")
    foreach ($rule in $rules) {
        [pscustomobject]@{
            DialPlan = Get-TtProp -InputObject $plan -Path "Identity"
            RuleName = Get-TtProp -InputObject $rule -Path "Name"
            Pattern = Get-TtProp -InputObject $rule -Path "Pattern"
            Translation = Get-TtProp -InputObject $rule -Path "Translation"
        }
    }
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
