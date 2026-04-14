<#
.SYNOPSIS
    Teams Voice Routes Without Gateways

.DESCRIPTION
    Identifiziert Teams Voice Routes Without Gateways in der Teams-Telefonie.

.NOTES
    File Name : 259_Find-TeamsVoiceRoutesWithoutGateways.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/259_Find-TeamsVoiceRoutesWithoutGateways.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsVoiceRoute")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    NumberPattern = "NumberPattern"
    Priority = "Priority"
    GatewayCount = "OnlinePstnGatewayList.Count"
    PstnUsageCount = "OnlinePstnUsages.Count"
    Description = "Description"
})


$Items = @(Get-CsVoiceRoute)

$Items = Where-TtMissingValue -Items $Items -Path "OnlinePstnGatewayList.Count"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
