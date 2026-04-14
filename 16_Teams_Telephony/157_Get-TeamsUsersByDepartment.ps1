<#
.SYNOPSIS
    Teams Users By Department

.DESCRIPTION
    Ruft Teams Users By Department aus der Teams-Telefonie ab.

.NOTES
    File Name : 157_Get-TeamsUsersByDepartment.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/157_Get-TeamsUsersByDepartment.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = Group-TtByPath -Items $Items -Path "Department" -Label "TeamsUsersByDepartment"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
