<#
.SYNOPSIS
    Teams Voice Routing Policy Pstn Usage Map

.DESCRIPTION
    Ruft Teams Voice Routing Policy Pstn Usage Map aus der Teams-Telefonie ab.

.NOTES
    File Name : 271_Get-TeamsVoiceRoutingPolicyPstnUsageMap.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/271_Get-TeamsVoiceRoutingPolicyPstnUsageMap.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineVoiceRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    OnlinePstnUsages = "OnlinePstnUsages"
})


$Items = @(Get-CsOnlineVoiceRoutingPolicy)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
