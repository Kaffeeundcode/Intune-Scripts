<#
.SYNOPSIS
    Teams Resource Account Phone Coverage

.DESCRIPTION
    Misst Teams Resource Account Phone Coverage in der Teams-Telefonie.

.NOTES
    File Name : 243_Measure-TeamsResourceAccountPhoneCoverage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/243_Measure-TeamsResourceAccountPhoneCoverage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineApplicationInstance)
$Result = Get-TtCoverageSummary -Items $Items -Path "PhoneNumber"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
