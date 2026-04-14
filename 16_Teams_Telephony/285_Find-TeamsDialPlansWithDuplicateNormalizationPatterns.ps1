<#
.SYNOPSIS
    Teams Dial Plans With Duplicate Normalization Patterns

.DESCRIPTION
    Identifiziert Teams Dial Plans With Duplicate Normalization Patterns in der Teams-Telefonie.

.NOTES
    File Name : 285_Find-TeamsDialPlansWithDuplicateNormalizationPatterns.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/285_Find-TeamsDialPlansWithDuplicateNormalizationPatterns.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTenantDialPlan)


$rows = foreach ($plan in $Items) {
    $rules = @(Get-TtProp -InputObject $plan -Path "NormalizationRules")
    foreach ($rule in $rules) {
        [pscustomobject]@{
            DialPlan = Get-TtProp -InputObject $plan -Path "Identity"
            Pattern = Get-TtProp -InputObject $rule -Path "Pattern"
        }
    }
}
$Result = @(
    $rows |
        Where-Object { $_.Pattern } |
        Group-Object Pattern |
        Where-Object { $_.Count -gt 1 } |
        Sort-Object Count -Descending |
        ForEach-Object {
            [pscustomobject]@{
                Pattern = $_.Name
                Count = $_.Count
                DialPlans = ($_.Group.DialPlan | Sort-Object -Unique) -join "; "
            }
        }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
