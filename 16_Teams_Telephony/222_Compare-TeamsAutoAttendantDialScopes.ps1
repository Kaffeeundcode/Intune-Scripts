<#
.SYNOPSIS
    Teams Auto Attendant Dial Scopes

.DESCRIPTION
    Vergleicht Teams Auto Attendant Dial Scopes in der Teams-Telefonie.

.NOTES
    File Name : 222_Compare-TeamsAutoAttendantDialScopes.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/222_Compare-TeamsAutoAttendantDialScopes.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsAutoAttendant)
$Result = Group-TtByPath -Items $Items -Path "DirectorySearchMethod" -Label "TeamsAutoAttendantDialScopes"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
