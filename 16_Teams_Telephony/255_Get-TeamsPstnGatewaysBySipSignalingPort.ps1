<#
.SYNOPSIS
    Teams Pstn Gateways By Sip Signaling Port

.DESCRIPTION
    Ruft Teams Pstn Gateways By Sip Signaling Port aus der Teams-Telefonie ab.

.NOTES
    File Name : 255_Get-TeamsPstnGatewaysBySipSignalingPort.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/255_Get-TeamsPstnGatewaysBySipSignalingPort.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlinePSTNGateway")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlinePSTNGateway)
$Result = Group-TtByPath -Items $Items -Path "SipSignalingPort" -Label "TeamsPstnGatewaysBySipSignalingPort"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
