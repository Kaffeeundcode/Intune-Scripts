<#
.SYNOPSIS
    Teams Telephony Policy Matrix

.DESCRIPTION
    Exportiert Teams Telephony Policy Matrix aus der Teams-Telefonie.

.NOTES
    File Name : 342_Export-TeamsTelephonyPolicyMatrix.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/342_Export-TeamsTelephonyPolicyMatrix.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    DisplayName = "DisplayName"
    UserPrincipalName = "UserPrincipalName"
    TenantDialPlan = "TenantDialPlan"
    VoiceRoutingPolicy = "VoiceRoutingPolicy"
    TeamsCallingPolicy = "TeamsCallingPolicy"
    TeamsEmergencyCallingPolicy = "TeamsEmergencyCallingPolicy"
    TeamsEmergencyCallRoutingPolicy = "TeamsEmergencyCallRoutingPolicy"
})


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
