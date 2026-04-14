<#
.SYNOPSIS
    Teams Resource Account Naming Standard

.DESCRIPTION
    Prueft Teams Resource Account Naming Standard in der Teams-Telefonie.

.NOTES
    File Name : 241_Test-TeamsResourceAccountNamingStandard.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/241_Test-TeamsResourceAccountNamingStandard.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    DisplayName = "DisplayName"
    UserPrincipalName = "UserPrincipalName"
    ApplicationId = "ApplicationId"
    PhoneNumber = "PhoneNumber"
    ObjectId = "ObjectId"
})


$Items = @(Get-CsOnlineApplicationInstance)

$Items = Where-TtMatch -Items $Items -Path "DisplayName" -Pattern "[^A-Za-z0-9\- _\.]"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
