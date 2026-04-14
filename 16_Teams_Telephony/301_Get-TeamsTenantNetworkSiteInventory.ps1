<#
.SYNOPSIS
    Teams Tenant Network Site Inventory

.DESCRIPTION
    Ruft Teams Tenant Network Site Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 301_Get-TeamsTenantNetworkSiteInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/301_Get-TeamsTenantNetworkSiteInventory.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantNetworkSite")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    Description = "Description"
    NetworkRegionID = "NetworkRegionID"
})


$Items = @(Get-CsTenantNetworkSite)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
