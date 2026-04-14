<#
.SYNOPSIS
    Teams Telephony Tenant Summary

.DESCRIPTION
    Ruft Teams Telephony Tenant Summary aus der Teams-Telefonie ab.

.NOTES
    File Name : 350_Get-TeamsTelephonyTenantSummary.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/350_Get-TeamsTelephonyTenantSummary.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$Result = @(
    [pscustomobject]@{ Metric = "TotalUsers"; Count = $Items.Count }
    [pscustomobject]@{ Metric = "UsersWithPhoneNumbers"; Count = (@($Items | Where-Object { Get-TtProp -InputObject $_ -Path "LineURI" })).Count }
    [pscustomobject]@{ Metric = "EnterpriseVoiceEnabled"; Count = (@($Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "EnterpriseVoiceEnabled") })).Count }
    [pscustomobject]@{ Metric = "UsersWithHostedVoicemail"; Count = (@($Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "HostedVoiceMail") })).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
