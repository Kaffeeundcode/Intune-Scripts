<#
.SYNOPSIS
    Teams Voice Routing Policies

.DESCRIPTION
    Exportiert Teams Voice Routing Policies aus der Teams-Telefonie.

.NOTES
    File Name : 176_Export-TeamsVoiceRoutingPolicies.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/176_Export-TeamsVoiceRoutingPolicies.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineVoiceRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineVoiceRoutingPolicy)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
