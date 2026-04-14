<#
.SYNOPSIS
    Teams Lis Civic Address Inventory

.DESCRIPTION
    Exportiert Teams Lis Civic Address Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 299_Export-TeamsLisCivicAddressInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/299_Export-TeamsLisCivicAddressInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineLisCivicAddress")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineLisCivicAddress)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
