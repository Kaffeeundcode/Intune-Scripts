<#
.SYNOPSIS
    Teams Resource Accounts

.DESCRIPTION
    Sichert Teams Resource Accounts aus der Teams-Telefonie.

.NOTES
    File Name : 250_Backup-TeamsResourceAccounts.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/250_Backup-TeamsResourceAccounts.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineApplicationInstance)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
