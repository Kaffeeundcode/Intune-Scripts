<#
.SYNOPSIS
    Teams Call Queues By Language

.DESCRIPTION
    Ruft Teams Call Queues By Language aus der Teams-Telefonie ab.

.NOTES
    File Name : 195_Get-TeamsCallQueuesByLanguage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/195_Get-TeamsCallQueuesByLanguage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsCallQueue)
$Result = Group-TtByPath -Items $Items -Path "LanguageId" -Label "TeamsCallQueuesByLanguage"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
