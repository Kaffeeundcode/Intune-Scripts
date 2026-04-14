<#
.SYNOPSIS
    Teams Resource Accounts With Duplicate Display Name

.DESCRIPTION
    Identifiziert Teams Resource Accounts With Duplicate Display Name in der Teams-Telefonie.

.NOTES
    File Name : 247_Find-TeamsResourceAccountsWithDuplicateDisplayName.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/247_Find-TeamsResourceAccountsWithDuplicateDisplayName.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineApplicationInstance)
$Result = Get-TtDuplicateValues -Items $Items -Path "DisplayName" -Label "TeamsResourceAccountsWithDuplicateDisplayName"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
