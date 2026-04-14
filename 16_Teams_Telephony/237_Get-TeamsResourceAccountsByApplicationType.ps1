<#
.SYNOPSIS
    Teams Resource Accounts By Application Type

.DESCRIPTION
    Ruft Teams Resource Accounts By Application Type aus der Teams-Telefonie ab.

.NOTES
    File Name : 237_Get-TeamsResourceAccountsByApplicationType.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/237_Get-TeamsResourceAccountsByApplicationType.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineApplicationInstance)
$Result = Group-TtByPath -Items $Items -Path "ApplicationId" -Label "TeamsResourceAccountsByApplicationType"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
