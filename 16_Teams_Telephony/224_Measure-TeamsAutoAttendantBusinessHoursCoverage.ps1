<#
.SYNOPSIS
    Teams Auto Attendant Business Hours Coverage

.DESCRIPTION
    Misst Teams Auto Attendant Business Hours Coverage in der Teams-Telefonie.

.NOTES
    File Name : 224_Measure-TeamsAutoAttendantBusinessHoursCoverage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/224_Measure-TeamsAutoAttendantBusinessHoursCoverage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsAutoAttendant)
$Result = Get-TtCoverageSummary -Items $Items -Path "Schedules.Count"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
