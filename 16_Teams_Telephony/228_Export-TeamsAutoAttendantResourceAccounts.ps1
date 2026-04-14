<#
.SYNOPSIS
    Teams Auto Attendant Resource Accounts

.DESCRIPTION
    Exportiert Teams Auto Attendant Resource Accounts aus der Teams-Telefonie.

.NOTES
    File Name : 228_Export-TeamsAutoAttendantResourceAccounts.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/228_Export-TeamsAutoAttendantResourceAccounts.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsAutoAttendant")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    ResourceAccountIds = "ResourceAccountIds"
})


$Items = @(Get-CsAutoAttendant)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
