<#
.SYNOPSIS
    Teams Call Queue Channel Bindings

.DESCRIPTION
    Ruft Teams Call Queue Channel Bindings aus der Teams-Telefonie ab.

.NOTES
    File Name : 208_Get-TeamsCallQueueChannelBindings.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/208_Get-TeamsCallQueueChannelBindings.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    ChannelId = "ChannelId"
})


$Items = @(Get-CsCallQueue)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
