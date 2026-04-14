<#
.SYNOPSIS
    Teams Pstn Gateway Inventory

.DESCRIPTION
    Ruft Teams Pstn Gateway Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 252_Get-TeamsPstnGatewayInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/252_Get-TeamsPstnGatewayInventory.csv",
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

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
