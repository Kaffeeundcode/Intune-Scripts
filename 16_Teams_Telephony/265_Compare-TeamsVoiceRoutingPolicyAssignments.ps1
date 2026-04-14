<#
.SYNOPSIS
    Teams Voice Routing Policy Assignments

.DESCRIPTION
    Vergleicht Teams Voice Routing Policy Assignments in der Teams-Telefonie.

.NOTES
    File Name : 265_Compare-TeamsVoiceRoutingPolicyAssignments.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/265_Compare-TeamsVoiceRoutingPolicyAssignments.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineVoiceRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineVoiceRoutingPolicy)
$Result = Group-TtByPath -Items $Items -Path "OnlinePstnUsages.Count" -Label "TeamsVoiceRoutingPolicyAssignments"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
