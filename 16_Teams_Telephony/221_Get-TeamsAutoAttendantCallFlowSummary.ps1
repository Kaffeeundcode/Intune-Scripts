<#
.SYNOPSIS
    Teams Auto Attendant Call Flow Summary

.DESCRIPTION
    Ruft Teams Auto Attendant Call Flow Summary aus der Teams-Telefonie ab.

.NOTES
    File Name : 221_Get-TeamsAutoAttendantCallFlowSummary.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/221_Get-TeamsAutoAttendantCallFlowSummary.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    CallFlowCount = "CallFlows.Count"
    HasDefaultCallFlow = "DefaultCallFlow.Id"
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
