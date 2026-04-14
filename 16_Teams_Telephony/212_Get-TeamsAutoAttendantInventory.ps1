<#
.SYNOPSIS
    Teams Auto Attendant Inventory

.DESCRIPTION
    Ruft Teams Auto Attendant Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 212_Get-TeamsAutoAttendantInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/212_Get-TeamsAutoAttendantInventory.csv",
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

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
