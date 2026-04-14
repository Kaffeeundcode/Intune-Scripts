<#
.SYNOPSIS
    Teams Auto Attendant Callable Entities

.DESCRIPTION
    Ruft Teams Auto Attendant Callable Entities aus der Teams-Telefonie ab.

.NOTES
    File Name : 230_Get-TeamsAutoAttendantCallableEntities.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/230_Get-TeamsAutoAttendantCallableEntities.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    CallFlowTargets = "CallFlows.Menu.Options.CallTarget.Id"
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
