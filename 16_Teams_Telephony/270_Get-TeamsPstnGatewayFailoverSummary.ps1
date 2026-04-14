<#
.SYNOPSIS
    Teams Pstn Gateway Failover Summary

.DESCRIPTION
    Ruft Teams Pstn Gateway Failover Summary aus der Teams-Telefonie ab.

.NOTES
    File Name : 270_Get-TeamsPstnGatewayFailoverSummary.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/270_Get-TeamsPstnGatewayFailoverSummary.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlinePSTNGateway")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    FailoverTimeSeconds = "FailoverTimeSeconds"
    SendSipOptions = "SendSipOptions"
    ForwardCallHistory = "ForwardCallHistory"
    ForwardPai = "ForwardPai"
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
