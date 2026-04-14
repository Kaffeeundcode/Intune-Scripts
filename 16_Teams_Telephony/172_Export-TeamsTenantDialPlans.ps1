<#
.SYNOPSIS
    Teams Tenant Dial Plans

.DESCRIPTION
    Exportiert Teams Tenant Dial Plans aus der Teams-Telefonie.

.NOTES
    File Name : 172_Export-TeamsTenantDialPlans.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/172_Export-TeamsTenantDialPlans.json",
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
