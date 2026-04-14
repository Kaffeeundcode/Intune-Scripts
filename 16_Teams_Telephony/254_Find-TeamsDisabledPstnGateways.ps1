<#
.SYNOPSIS
    Teams Disabled Pstn Gateways

.DESCRIPTION
    Identifiziert Teams Disabled Pstn Gateways in der Teams-Telefonie.

.NOTES
    File Name : 254_Find-TeamsDisabledPstnGateways.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/254_Find-TeamsDisabledPstnGateways.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlinePSTNGateway")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    Fqdn = "Fqdn"
    Enabled = "Enabled"
    SipSignalingPort = "SipSignalingPort"
    ForwardCallHistory = "ForwardCallHistory"
    ForwardPai = "ForwardPai"
    SendSipOptions = "SendSipOptions"
    MaxConcurrentSessions = "MaxConcurrentSessions"
})


$Items = @(Get-CsOnlinePSTNGateway)

$Items = $Items | Where-Object { -not [bool](Get-TtProp -InputObject $_ -Path "Enabled") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
