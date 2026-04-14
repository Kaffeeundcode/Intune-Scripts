<#
.SYNOPSIS
    Teams Telephony User Configuration

.DESCRIPTION
    Sichert Teams Telephony User Configuration aus der Teams-Telefonie.

.NOTES
    File Name : 343_Backup-TeamsTelephonyUserConfiguration.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/343_Backup-TeamsTelephonyUserConfiguration.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
