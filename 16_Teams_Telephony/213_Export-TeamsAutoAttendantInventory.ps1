<#
.SYNOPSIS
    Teams Auto Attendant Inventory

.DESCRIPTION
    Exportiert Teams Auto Attendant Inventory aus der Teams-Telefonie.

.NOTES
    File Name : 213_Export-TeamsAutoAttendantInventory.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/213_Export-TeamsAutoAttendantInventory.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsAutoAttendant)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
