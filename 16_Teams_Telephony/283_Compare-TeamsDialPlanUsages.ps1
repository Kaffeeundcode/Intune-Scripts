<#
.SYNOPSIS
    Teams Dial Plan Usages

.DESCRIPTION
    Vergleicht Teams Dial Plan Usages in der Teams-Telefonie.

.NOTES
    File Name : 283_Compare-TeamsDialPlanUsages.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/283_Compare-TeamsDialPlanUsages.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTenantDialPlan)
$Result = Group-TtByPath -Items $Items -Path "PstnUsages.Count" -Label "TeamsDialPlanUsages"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
