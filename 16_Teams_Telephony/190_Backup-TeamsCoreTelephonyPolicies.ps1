<#
.SYNOPSIS
    Teams Core Telephony Policies

.DESCRIPTION
    Sichert Teams Core Telephony Policies aus der Teams-Telefonie.

.NOTES
    File Name : 190_Backup-TeamsCoreTelephonyPolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/190_Backup-TeamsCoreTelephonyPolicies.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan", "Get-CsVoiceRoute", "Get-CsOnlineVoiceRoutingPolicy", "Get-CsTeamsCallingPolicy", "Get-CsCallingLineIdentity", "Get-CsTeamsCallParkPolicy", "Get-CsTeamsIPPhonePolicy", "Get-CsTeamsEmergencyCallingPolicy", "Get-CsTeamsEmergencyCallRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTenantDialPlan)


$Result = [ordered]@{
    DialPlans = @(Get-CsTenantDialPlan)
    VoiceRoutes = @(Get-CsVoiceRoute)
    VoiceRoutingPolicies = @(Get-CsOnlineVoiceRoutingPolicy)
    CallingPolicies = @(Get-CsTeamsCallingPolicy)
    CallingLineIdentities = @(Get-CsCallingLineIdentity)
    CallParkPolicies = @(Get-CsTeamsCallParkPolicy)
    IPPhonePolicies = @(Get-CsTeamsIPPhonePolicy)
    EmergencyCallingPolicies = @(Get-CsTeamsEmergencyCallingPolicy)
    EmergencyRoutingPolicies = @(Get-CsTeamsEmergencyCallRoutingPolicy)
}


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
