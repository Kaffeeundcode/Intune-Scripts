<#
.SYNOPSIS
    Teams Number Assignment Coverage

.DESCRIPTION
    Misst Teams Number Assignment Coverage in der Teams-Telefonie.

.NOTES
    File Name : 165_Measure-TeamsNumberAssignmentCoverage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/165_Measure-TeamsNumberAssignmentCoverage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = Get-TtCoverageSummary -Items $Items -Path "LineURI"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
