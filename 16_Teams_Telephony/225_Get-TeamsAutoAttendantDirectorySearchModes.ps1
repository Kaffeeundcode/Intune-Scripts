<#
.SYNOPSIS
    Teams Auto Attendant Directory Search Modes

.DESCRIPTION
    Ruft Teams Auto Attendant Directory Search Modes aus der Teams-Telefonie ab.

.NOTES
    File Name : 225_Get-TeamsAutoAttendantDirectorySearchModes.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/225_Get-TeamsAutoAttendantDirectorySearchModes.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsAutoAttendant)
$Result = Group-TtByPath -Items $Items -Path "DirectorySearchMethod" -Label "TeamsAutoAttendantDirectorySearchModes"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
