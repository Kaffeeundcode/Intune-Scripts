<#
.SYNOPSIS
    Teams Auto Attendants With Voice Response

.DESCRIPTION
    Ruft Teams Auto Attendants With Voice Response aus der Teams-Telefonie ab.

.NOTES
    File Name : 216_Get-TeamsAutoAttendantsWithVoiceResponse.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/216_Get-TeamsAutoAttendantsWithVoiceResponse.csv",
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

$Items = $Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "VoiceResponseEnabled") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
