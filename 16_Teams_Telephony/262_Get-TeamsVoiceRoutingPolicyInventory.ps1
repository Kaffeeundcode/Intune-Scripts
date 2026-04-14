<#
.SYNOPSIS
    Teams Voice Routing Policy Inventory

.DESCRIPTION
    Ruft Teams Voice Routing Policy Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 262_Get-TeamsVoiceRoutingPolicyInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/262_Get-TeamsVoiceRoutingPolicyInventory.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineVoiceRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    PstnUsageCount = "OnlinePstnUsages.Count"
    Description = "Description"
})


$Items = @(Get-CsOnlineVoiceRoutingPolicy)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
