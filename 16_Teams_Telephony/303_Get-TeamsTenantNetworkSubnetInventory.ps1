<#
.SYNOPSIS
    Teams Tenant Network Subnet Inventory

.DESCRIPTION
    Ruft Teams Tenant Network Subnet Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 303_Get-TeamsTenantNetworkSubnetInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/303_Get-TeamsTenantNetworkSubnetInventory.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantNetworkSubnet")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    MaskBits = "MaskBits"
    NetworkSiteID = "NetworkSiteID"
    Description = "Description"
})


$Items = @(Get-CsTenantNetworkSubnet)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
