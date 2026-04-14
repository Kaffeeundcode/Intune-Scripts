<#
.SYNOPSIS
    Teams Voice Routes

.DESCRIPTION
    Ruft Teams Voice Routes aus der Teams-Telefonie ab.

.NOTES
    File Name : 173_Get-TeamsVoiceRoutes.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/173_Get-TeamsVoiceRoutes.csv",
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

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
