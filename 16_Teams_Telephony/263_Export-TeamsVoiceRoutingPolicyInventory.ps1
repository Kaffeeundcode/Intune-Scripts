<#
.SYNOPSIS
    Teams Voice Routing Policy Inventory

.DESCRIPTION
    Exportiert Teams Voice Routing Policy Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 263_Export-TeamsVoiceRoutingPolicyInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/263_Export-TeamsVoiceRoutingPolicyInventory.json",
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
