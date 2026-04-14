<#
.SYNOPSIS
    Teams Users By City

.DESCRIPTION
    Ruft Teams Users By City aus der Teams-Telefonie ab.

.NOTES
    File Name : 159_Get-TeamsUsersByCity.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/159_Get-TeamsUsersByCity.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = Group-TtByPath -Items $Items -Path "City" -Label "TeamsUsersByCity"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
