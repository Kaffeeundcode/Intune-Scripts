<#
.SYNOPSIS
    Teams Telephony Executive Summary

.DESCRIPTION
    Exportiert Teams Telephony Executive Summary aus der Teams-Telefonie.

.NOTES
    File Name : 349_Export-TeamsTelephonyExecutiveSummary.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/349_Export-TeamsTelephonyExecutiveSummary.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$voiceUsers = @($Items | Where-Object { Get-TtProp -InputObject $_ -Path "LineURI" })
$Result = @(
    [pscustomobject]@{ Metric = "TotalUsers"; Value = $Items.Count }
    [pscustomobject]@{ Metric = "VoiceUsers"; Value = $voiceUsers.Count }
    [pscustomobject]@{ Metric = "VoiceEnabledUsers"; Value = (@($Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "EnterpriseVoiceEnabled") })).Count }
    [pscustomobject]@{ Metric = "UsersWithoutUsageLocation"; Value = (@($Items | Where-Object { -not (Get-TtProp -InputObject $_ -Path "UsageLocation") })).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
