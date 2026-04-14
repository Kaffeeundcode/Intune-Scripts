<#
.SYNOPSIS
    Teams Call Queue Agent Coverage

.DESCRIPTION
    Misst Teams Call Queue Agent Coverage in der Teams-Telefonie.

.NOTES
    File Name : 205_Measure-TeamsCallQueueAgentCoverage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/205_Measure-TeamsCallQueueAgentCoverage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsCallQueue)
$Result = Get-TtCoverageSummary -Items $Items -Path "Agents.Count"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
