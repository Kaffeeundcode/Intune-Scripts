<#
.SYNOPSIS
    Teams Calling Line Identities

.DESCRIPTION
    Exportiert Teams Calling Line Identities aus der Teams-Telefonie.

.NOTES
    File Name : 180_Export-TeamsCallingLineIdentities.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/180_Export-TeamsCallingLineIdentities.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallingLineIdentity")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsCallingLineIdentity)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
