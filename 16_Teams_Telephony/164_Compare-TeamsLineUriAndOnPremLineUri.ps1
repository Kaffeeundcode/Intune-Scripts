<#
.SYNOPSIS
    Teams Line Uri And On Prem Line Uri

.DESCRIPTION
    Vergleicht Teams Line Uri And On Prem Line Uri in der Teams-Telefonie.

.NOTES
    File Name : 164_Compare-TeamsLineUriAndOnPremLineUri.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/164_Compare-TeamsLineUriAndOnPremLineUri.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = Compare-TtPaths -Items $Items -LeftPath "LineURI" -RightPath "OnPremLineURI" -LeftLabel "LineURI" -RightLabel "OnPremLineURI"

$Result = @($Result | Sort-Object DisplayName)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
