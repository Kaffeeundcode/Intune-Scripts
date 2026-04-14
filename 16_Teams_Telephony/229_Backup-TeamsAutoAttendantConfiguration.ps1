<#
.SYNOPSIS
    Teams Auto Attendant Configuration

.DESCRIPTION
    Sichert Teams Auto Attendant Configuration aus der Teams-Telefonie.

.NOTES
    File Name : 229_Backup-TeamsAutoAttendantConfiguration.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/229_Backup-TeamsAutoAttendantConfiguration.json",
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
