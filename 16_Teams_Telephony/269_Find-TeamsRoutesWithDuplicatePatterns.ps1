<#
.SYNOPSIS
    Teams Routes With Duplicate Patterns

.DESCRIPTION
    Identifiziert Teams Routes With Duplicate Patterns in der Teams-Telefonie.

.NOTES
    File Name : 269_Find-TeamsRoutesWithDuplicatePatterns.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/269_Find-TeamsRoutesWithDuplicatePatterns.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsVoiceRoute")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsVoiceRoute)
$Result = Get-TtDuplicateValues -Items $Items -Path "NumberPattern" -Label "TeamsRoutesWithDuplicatePatterns"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
