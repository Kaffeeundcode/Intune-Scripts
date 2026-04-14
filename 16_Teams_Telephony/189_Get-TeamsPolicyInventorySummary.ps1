<#
.SYNOPSIS
    Teams Policy Inventory Summary

.DESCRIPTION
    Ruft Teams Policy Inventory Summary aus der Teams-Telefonie ab.

.NOTES
    File Name : 189_Get-TeamsPolicyInventorySummary.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/189_Get-TeamsPolicyInventorySummary.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantDialPlan", "Get-CsVoiceRoute", "Get-CsOnlineVoiceRoutingPolicy", "Get-CsTeamsCallingPolicy", "Get-CsCallingLineIdentity", "Get-CsTeamsCallParkPolicy", "Get-CsTeamsIPPhonePolicy", "Get-CsTeamsEmergencyCallingPolicy", "Get-CsTeamsEmergencyCallRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsTenantDialPlan)


$Result = @(
    [pscustomobject]@{ PolicyType = "DialPlans"; Count = (@(Get-CsTenantDialPlan)).Count }
    [pscustomobject]@{ PolicyType = "VoiceRoutes"; Count = (@(Get-CsVoiceRoute)).Count }
    [pscustomobject]@{ PolicyType = "VoiceRoutingPolicies"; Count = (@(Get-CsOnlineVoiceRoutingPolicy)).Count }
    [pscustomobject]@{ PolicyType = "CallingPolicies"; Count = (@(Get-CsTeamsCallingPolicy)).Count }
    [pscustomobject]@{ PolicyType = "CallingLineIdentities"; Count = (@(Get-CsCallingLineIdentity)).Count }
    [pscustomobject]@{ PolicyType = "CallParkPolicies"; Count = (@(Get-CsTeamsCallParkPolicy)).Count }
    [pscustomobject]@{ PolicyType = "IPPhonePolicies"; Count = (@(Get-CsTeamsIPPhonePolicy)).Count }
    [pscustomobject]@{ PolicyType = "EmergencyCallingPolicies"; Count = (@(Get-CsTeamsEmergencyCallingPolicy)).Count }
    [pscustomobject]@{ PolicyType = "EmergencyRoutingPolicies"; Count = (@(Get-CsTeamsEmergencyCallRoutingPolicy)).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
