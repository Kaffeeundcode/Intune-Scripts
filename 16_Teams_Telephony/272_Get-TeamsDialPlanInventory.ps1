<#
.SYNOPSIS
    Teams Dial Plan Inventory

.DESCRIPTION
    Ruft Teams Dial Plan Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 272_Get-TeamsDialPlanInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/272_Get-TeamsDialPlanInventory.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    SimpleName = "SimpleName"
    Description = "Description"
    NormalizationRuleCount = "NormalizationRules.Count"
    ExternalAccessPrefix = "ExternalAccessPrefix"
    PstnUsageCount = "PstnUsages.Count"
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
