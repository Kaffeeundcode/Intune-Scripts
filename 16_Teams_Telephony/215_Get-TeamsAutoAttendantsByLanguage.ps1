<#
.SYNOPSIS
    Teams Auto Attendants By Language

.DESCRIPTION
    Ruft Teams Auto Attendants By Language aus der Teams-Telefonie ab.

.NOTES
    File Name : 215_Get-TeamsAutoAttendantsByLanguage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/215_Get-TeamsAutoAttendantsByLanguage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsAutoAttendant)
$Result = Group-TtByPath -Items $Items -Path "LanguageId" -Label "TeamsAutoAttendantsByLanguage"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
