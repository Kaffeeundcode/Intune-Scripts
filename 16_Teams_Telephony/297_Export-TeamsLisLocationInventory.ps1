<#
.SYNOPSIS
    Teams Lis Location Inventory

.DESCRIPTION
    Exportiert Teams Lis Location Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 297_Export-TeamsLisLocationInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/297_Export-TeamsLisLocationInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineLisLocation")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineLisLocation)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
