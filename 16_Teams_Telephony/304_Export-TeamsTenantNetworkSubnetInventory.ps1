<#
.SYNOPSIS
    Teams Tenant Network Subnet Inventory

.DESCRIPTION
    Exportiert Teams Tenant Network Subnet Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 304_Export-TeamsTenantNetworkSubnetInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/304_Export-TeamsTenantNetworkSubnetInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantNetworkSubnet")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTenantNetworkSubnet)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
