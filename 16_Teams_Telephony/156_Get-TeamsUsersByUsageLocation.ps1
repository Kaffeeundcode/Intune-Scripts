<#
.SYNOPSIS
    Teams Users By Usage Location

.DESCRIPTION
    Ruft Teams Users By Usage Location aus der Teams-Telefonie ab.

.NOTES
    File Name : 156_Get-TeamsUsersByUsageLocation.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/156_Get-TeamsUsersByUsageLocation.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = Group-TtByPath -Items $Items -Path "UsageLocation" -Label "TeamsUsersByUsageLocation"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
