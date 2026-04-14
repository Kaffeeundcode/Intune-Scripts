<#
.SYNOPSIS
    Teams Resource Account Phone Numbers

.DESCRIPTION
    Exportiert Teams Resource Account Phone Numbers aus der Teams-Telefonie.

.NOTES
    File Name : 249_Export-TeamsResourceAccountPhoneNumbers.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/249_Export-TeamsResourceAccountPhoneNumbers.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    DisplayName = "DisplayName"
    UserPrincipalName = "UserPrincipalName"
    PhoneNumber = "PhoneNumber"
})


$Items = @(Get-CsOnlineApplicationInstance)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
