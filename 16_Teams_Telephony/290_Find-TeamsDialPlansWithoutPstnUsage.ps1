<#
.SYNOPSIS
    Teams Dial Plans Without Pstn Usage

.DESCRIPTION
    Identifiziert Teams Dial Plans Without Pstn Usage in der Teams-Telefonie.

.NOTES
    File Name : 290_Find-TeamsDialPlansWithoutPstnUsage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/290_Find-TeamsDialPlansWithoutPstnUsage.csv",
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

$Items = Where-TtMissingValue -Items $Items -Path "PstnUsages.Count"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
