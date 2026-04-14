<#
.SYNOPSIS
    Teams Resource Account Inventory

.DESCRIPTION
    Exportiert Teams Resource Account Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 234_Export-TeamsResourceAccountInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/234_Export-TeamsResourceAccountInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineApplicationInstance)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
