<#
.SYNOPSIS
    Teams Auto Attendants Without Operator

.DESCRIPTION
    Identifiziert Teams Auto Attendants Without Operator in der Teams-Telefonie.

.NOTES
    File Name : 218_Find-TeamsAutoAttendantsWithoutOperator.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/218_Find-TeamsAutoAttendantsWithoutOperator.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    LanguageId = "LanguageId"
    VoiceResponseEnabled = "VoiceResponseEnabled"
    ResourceAccountCount = "ResourceAccountIds.Count"
    ScheduleCount = "Schedules.Count"
    CallFlowCount = "CallFlows.Count"
    OperatorId = "Operator.Id"
})


$Items = @(Get-CsAutoAttendant)

$Items = Where-TtMissingValue -Items $Items -Path "Operator.Id"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
