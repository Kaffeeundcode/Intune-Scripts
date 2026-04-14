<#
.SYNOPSIS
    Teams Telephony Configuration Completeness

.DESCRIPTION
    Prueft Teams Telephony Configuration Completeness in der Teams-Telefonie.

.NOTES
    File Name : 344_Test-TeamsTelephonyConfigurationCompleteness.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/344_Test-TeamsTelephonyConfigurationCompleteness.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$voiceUsers = @($Items | Where-Object { [bool](Get-TtProp -InputObject $_ -Path "EnterpriseVoiceEnabled") -or (Get-TtProp -InputObject $_ -Path "LineURI") })
$Result = foreach ($user in $voiceUsers) {
    $issues = @()
    if (-not (Get-TtProp -InputObject $user -Path "UsageLocation")) { $issues += "MissingUsageLocation" }
    if (-not (Get-TtProp -InputObject $user -Path "HostedVoiceMail")) { $issues += "HostedVoiceMailDisabledOrUnknown" }
    if (-not (Get-TtProp -InputObject $user -Path "LineURI")) { $issues += "MissingLineURI" }
    if ($issues.Count -gt 0) {
        [pscustomobject]@{
            DisplayName = Get-TtProp -InputObject $user -Path "DisplayName"
            UserPrincipalName = Get-TtProp -InputObject $user -Path "UserPrincipalName"
            Issues = $issues -join "; "
        }
    }
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
