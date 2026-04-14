<#
.SYNOPSIS
    Teams Telephony Assignments By Country

.DESCRIPTION
    Vergleicht Teams Telephony Assignments By Country in der Teams-Telefonie.

.NOTES
    File Name : 339_Compare-TeamsTelephonyAssignmentsByCountry.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/339_Compare-TeamsTelephonyAssignmentsByCountry.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$voiceUsers = @($Items | Where-Object { Get-TtProp -InputObject $_ -Path "LineURI" })
$Result = Group-TtByPath -Items $voiceUsers -Path "UsageLocation" -Label "UsageLocation"


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
