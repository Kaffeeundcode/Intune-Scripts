<#
.SYNOPSIS
    Teams Pstn Gateway Inventory

.DESCRIPTION
    Exportiert Teams Pstn Gateway Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 253_Export-TeamsPstnGatewayInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/253_Export-TeamsPstnGatewayInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlinePSTNGateway")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlinePSTNGateway)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
