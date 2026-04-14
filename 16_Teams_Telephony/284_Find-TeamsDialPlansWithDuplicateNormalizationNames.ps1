<#
.SYNOPSIS
    Teams Dial Plans With Duplicate Normalization Names

.DESCRIPTION
    Identifiziert Teams Dial Plans With Duplicate Normalization Names in der Teams-Telefonie.

.NOTES
    File Name : 284_Find-TeamsDialPlansWithDuplicateNormalizationNames.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/284_Find-TeamsDialPlansWithDuplicateNormalizationNames.csv",
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
            RuleName = Get-TtProp -InputObject $rule -Path "Name"
        }
    }
}
$Result = @(
    $rows |
        Where-Object { $_.RuleName } |
        Group-Object RuleName |
        Where-Object { $_.Count -gt 1 } |
        Sort-Object Count -Descending |
        ForEach-Object {
            [pscustomobject]@{
                RuleName = $_.Name
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
