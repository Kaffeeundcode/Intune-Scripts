<#
.SYNOPSIS
    Teams Voice Route Inventory

.DESCRIPTION
    Exportiert Teams Voice Route Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 258_Export-TeamsVoiceRouteInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/258_Export-TeamsVoiceRouteInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsVoiceRoute")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsVoiceRoute)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
