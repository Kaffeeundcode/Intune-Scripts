<#
.SYNOPSIS
    Teams Duplicate Line Uri Candidates

.DESCRIPTION
    Identifiziert Teams Duplicate Line Uri Candidates in der Teams-Telefonie.

.NOTES
    File Name : 169_Find-TeamsDuplicateLineUriCandidates.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/169_Find-TeamsDuplicateLineUriCandidates.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsOnlineUser -ResultSize Unlimited)
$Result = Get-TtDuplicateValues -Items $Items -Path "LineURI" -Label "TeamsDuplicateLineUriCandidates"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
