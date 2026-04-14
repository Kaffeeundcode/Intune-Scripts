<#
.SYNOPSIS
    Teams Auto Attendant Operator Targets

.DESCRIPTION
    Ruft Teams Auto Attendant Operator Targets aus der Teams-Telefonie ab.

.NOTES
    File Name : 227_Get-TeamsAutoAttendantOperatorTargets.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/227_Get-TeamsAutoAttendantOperatorTargets.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
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
