<#
.SYNOPSIS
    Teams Resource Accounts By Phone Number Prefix

.DESCRIPTION
    Ruft Teams Resource Accounts By Phone Number Prefix aus der Teams-Telefonie ab.

.NOTES
    File Name : 245_Get-TeamsResourceAccountsByPhoneNumberPrefix.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/245_Get-TeamsResourceAccountsByPhoneNumberPrefix.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineApplicationInstance)


$Result = @(
    $Items |
        Where-Object { Get-TtProp -InputObject $_ -Path "PhoneNumber" } |
        ForEach-Object {
            $phone = [string](Get-TtProp -InputObject $_ -Path "PhoneNumber")
            $prefix = if ($phone.Length -ge 6) { $phone.Substring(0, 6) } else { $phone }
            [pscustomobject]@{
                Prefix = $prefix
            }
        } |
        Group-Object Prefix |
        Sort-Object Count -Descending |
        ForEach-Object {
            [pscustomobject]@{
                Prefix = $_.Name
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
