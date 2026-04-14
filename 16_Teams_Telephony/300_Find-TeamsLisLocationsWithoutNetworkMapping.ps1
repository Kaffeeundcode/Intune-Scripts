<#
.SYNOPSIS
    Teams Lis Locations Without Network Mapping

.DESCRIPTION
    Identifiziert Teams Lis Locations Without Network Mapping in der Teams-Telefonie.

.NOTES
    File Name : 300_Find-TeamsLisLocationsWithoutNetworkMapping.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/300_Find-TeamsLisLocationsWithoutNetworkMapping.csv",
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

$Items = Where-TtMissingValue -Items $Items -Path "NetworkObjectId"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object LocationId)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
