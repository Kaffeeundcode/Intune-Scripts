<#
.SYNOPSIS
    Teams Pstn Gateway Forwarding State

.DESCRIPTION
    Prueft Teams Pstn Gateway Forwarding State in der Teams-Telefonie.

.NOTES
    File Name : 256_Test-TeamsPstnGatewayForwardingState.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/256_Test-TeamsPstnGatewayForwardingState.csv",
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

$Items = $Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "ForwardCallHistory") -or [bool](Get-TtProp -InputObject $_ -Path "ForwardPai") }

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
