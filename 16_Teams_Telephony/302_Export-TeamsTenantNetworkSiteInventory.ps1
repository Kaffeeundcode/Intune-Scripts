<#
.SYNOPSIS
    Teams Tenant Network Site Inventory

.DESCRIPTION
    Exportiert Teams Tenant Network Site Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 302_Export-TeamsTenantNetworkSiteInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/302_Export-TeamsTenantNetworkSiteInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsTenantNetworkSite")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsTenantNetworkSite)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
