<#
.SYNOPSIS
    Teams Direct Routing Configuration

.DESCRIPTION
    Sichert Teams Direct Routing Configuration aus der Teams-Telefonie.

.NOTES
    File Name : 267_Backup-TeamsDirectRoutingConfiguration.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/267_Backup-TeamsDirectRoutingConfiguration.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlinePSTNGateway", "Get-CsVoiceRoute", "Get-CsOnlineVoiceRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsVoiceRoute)


$Result = [ordered]@{
    Gateways = @(Get-CsOnlinePSTNGateway)
    VoiceRoutes = @(Get-CsVoiceRoute)
    VoiceRoutingPolicies = @(Get-CsOnlineVoiceRoutingPolicy)
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
