<#
.SYNOPSIS
    Teams Emergency Address Coverage

.DESCRIPTION
    Misst Teams Emergency Address Coverage in der Teams-Telefonie.

.NOTES
    File Name : 307_Measure-TeamsEmergencyAddressCoverage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/307_Measure-TeamsEmergencyAddressCoverage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineLisLocation", "Get-CsOnlineLisCivicAddress")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineLisCivicAddress)


$locations = @(Get-CsOnlineLisLocation)
$addresses = @(Get-CsOnlineLisCivicAddress)
$Result = @(
    [pscustomobject]@{ Metric = "CivicAddresses"; Count = $addresses.Count }
    [pscustomobject]@{ Metric = "LisLocations"; Count = $locations.Count }
    [pscustomobject]@{ Metric = "MappedLocations"; Count = (@($locations | Where-Object { Get-TtProp -InputObject $_ -Path "NetworkObjectId" })).Count }
    [pscustomobject]@{ Metric = "UnmappedLocations"; Count = (@($locations | Where-Object { -not (Get-TtProp -InputObject $_ -Path "NetworkObjectId") })).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
