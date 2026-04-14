<#
.SYNOPSIS
    Teams Dial Plan Translation Patterns

.DESCRIPTION
    Ruft Teams Dial Plan Translation Patterns aus der Teams-Telefonie ab.

.NOTES
    File Name : 288_Get-TeamsDialPlanTranslationPatterns.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/288_Get-TeamsDialPlanTranslationPatterns.csv",
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
