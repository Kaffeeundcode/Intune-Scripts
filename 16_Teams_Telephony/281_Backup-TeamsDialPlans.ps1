<#
.SYNOPSIS
    Teams Dial Plans

.DESCRIPTION
    Sichert Teams Dial Plans aus der Teams-Telefonie.

.NOTES
    File Name : 281_Backup-TeamsDialPlans.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/281_Backup-TeamsDialPlans.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTenantDialPlan)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
