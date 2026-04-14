<#
.SYNOPSIS
    Teams Voice Routes By Priority

.DESCRIPTION
    Vergleicht Teams Voice Routes By Priority in der Teams-Telefonie.

.NOTES
    File Name : 260_Compare-TeamsVoiceRoutesByPriority.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/260_Compare-TeamsVoiceRoutesByPriority.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsVoiceRoute")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsVoiceRoute)
$Result = Group-TtByPath -Items $Items -Path "Priority" -Label "TeamsVoiceRoutesByPriority"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
