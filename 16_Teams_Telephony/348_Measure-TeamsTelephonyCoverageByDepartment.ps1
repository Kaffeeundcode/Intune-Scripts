<#
.SYNOPSIS
    Teams Telephony Coverage By Department

.DESCRIPTION
    Misst Teams Telephony Coverage By Department in der Teams-Telefonie.

.NOTES
    File Name : 348_Measure-TeamsTelephonyCoverageByDepartment.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/348_Measure-TeamsTelephonyCoverageByDepartment.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$voiceUsers = @($Items | Where-Object { Get-TtProp -InputObject $_ -Path "LineURI" })
$Result = Group-TtByPath -Items $voiceUsers -Path "Department" -Label "Department"


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
