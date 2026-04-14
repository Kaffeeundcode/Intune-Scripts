<#
.SYNOPSIS
    Teams Voice Routes

.DESCRIPTION
    Exportiert Teams Voice Routes aus der Teams-Telefonie.

.NOTES
    File Name : 174_Export-TeamsVoiceRoutes.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/174_Export-TeamsVoiceRoutes.json",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsVoiceRoute")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsVoiceRoute)
$Result = $Items

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
