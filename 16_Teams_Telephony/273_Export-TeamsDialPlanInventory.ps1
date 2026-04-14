<#
.SYNOPSIS
    Teams Dial Plan Inventory

.DESCRIPTION
    Exportiert Teams Dial Plan Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 273_Export-TeamsDialPlanInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/273_Export-TeamsDialPlanInventory.json",
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
