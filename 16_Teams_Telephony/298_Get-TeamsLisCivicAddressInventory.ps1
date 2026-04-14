<#
.SYNOPSIS
    Teams Lis Civic Address Inventory

.DESCRIPTION
    Ruft Teams Lis Civic Address Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 298_Get-TeamsLisCivicAddressInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/298_Get-TeamsLisCivicAddressInventory.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineLisCivicAddress")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    CivicAddressId = "CivicAddressId"
    CompanyName = "CompanyName"
    City = "City"
    CountryOrRegion = "CountryOrRegion"
    PostalCode = "PostalCode"
})


$Items = @(Get-CsOnlineLisCivicAddress)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object CivicAddressId)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
