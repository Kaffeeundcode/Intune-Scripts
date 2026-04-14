<#
.SYNOPSIS
    Teams Lis Location Inventory

.DESCRIPTION
    Ruft Teams Lis Location Inventory aus der Teams-Telefonie ab.

.NOTES
    File Name : 296_Get-TeamsLisLocationInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/296_Get-TeamsLisLocationInventory.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineLisLocation")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    LocationId = "LocationId"
    Description = "Description"
    NetworkObjectId = "NetworkObjectId"
    NetworkObjectType = "NetworkObjectType"
})


$Items = @(Get-CsOnlineLisLocation)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object LocationId)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
