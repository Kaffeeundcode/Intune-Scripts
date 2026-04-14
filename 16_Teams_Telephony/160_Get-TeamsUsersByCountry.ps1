<#
.SYNOPSIS
    Teams Users By Country

.DESCRIPTION
    Ruft Teams Users By Country aus der Teams-Telefonie ab.

.NOTES
    File Name : 160_Get-TeamsUsersByCountry.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/160_Get-TeamsUsersByCountry.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = Group-TtByPath -Items $Items -Path "Country" -Label "TeamsUsersByCountry"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
