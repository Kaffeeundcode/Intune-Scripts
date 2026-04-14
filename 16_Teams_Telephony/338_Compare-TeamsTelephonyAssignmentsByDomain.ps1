<#
.SYNOPSIS
    Teams Telephony Assignments By Domain

.DESCRIPTION
    Vergleicht Teams Telephony Assignments By Domain in der Teams-Telefonie.

.NOTES
    File Name : 338_Compare-TeamsTelephonyAssignmentsByDomain.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/338_Compare-TeamsTelephonyAssignmentsByDomain.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineUser")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineUser -ResultSize Unlimited)


$voiceUsers = @($Items | Where-Object { Get-TtProp -InputObject $_ -Path "LineURI" })
$Result = @(
    $voiceUsers |
        ForEach-Object {
            $upn = [string](Get-TtProp -InputObject $_ -Path "UserPrincipalName")
            $domain = if ($upn -match "@") { $upn.Split("@")[-1] } else { "<Unknown>" }
            [pscustomobject]@{ Domain = $domain }
        } |
        Group-Object Domain |
        Sort-Object Count -Descending |
        ForEach-Object {
            [pscustomobject]@{
                Domain = $_.Name
                Count = $_.Count
            }
        }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
