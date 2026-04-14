<#
.SYNOPSIS
    Teams Network Subnets Without Sites

.DESCRIPTION
    Identifiziert Teams Network Subnets Without Sites in der Teams-Telefonie.

.NOTES
    File Name : 305_Find-TeamsNetworkSubnetsWithoutSites.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/305_Find-TeamsNetworkSubnetsWithoutSites.csv",
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

$Items = Where-TtMissingValue -Items $Items -Path "NetworkSiteID"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
