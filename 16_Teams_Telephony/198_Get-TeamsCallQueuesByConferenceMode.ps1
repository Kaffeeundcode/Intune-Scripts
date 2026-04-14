<#
.SYNOPSIS
    Teams Call Queues By Conference Mode

.DESCRIPTION
    Ruft Teams Call Queues By Conference Mode aus der Teams-Telefonie ab.

.NOTES
    File Name : 198_Get-TeamsCallQueuesByConferenceMode.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/198_Get-TeamsCallQueuesByConferenceMode.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsCallQueue)
$Result = Group-TtByPath -Items $Items -Path "ConferenceMode" -Label "TeamsCallQueuesByConferenceMode"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
