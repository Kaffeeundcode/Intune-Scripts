<#
.SYNOPSIS
    Teams Resource Accounts With Duplicate Phone Number

.DESCRIPTION
    Identifiziert Teams Resource Accounts With Duplicate Phone Number in der Teams-Telefonie.

.NOTES
    File Name : 248_Find-TeamsResourceAccountsWithDuplicatePhoneNumber.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/248_Find-TeamsResourceAccountsWithDuplicatePhoneNumber.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineApplicationInstance)
$Result = Get-TtDuplicateValues -Items $Items -Path "PhoneNumber" -Label "TeamsResourceAccountsWithDuplicatePhoneNumber"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
