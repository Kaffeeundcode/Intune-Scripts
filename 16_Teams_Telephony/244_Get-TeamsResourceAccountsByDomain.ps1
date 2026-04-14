<#
.SYNOPSIS
    Teams Resource Accounts By Domain

.DESCRIPTION
    Ruft Teams Resource Accounts By Domain aus der Teams-Telefonie ab.

.NOTES
    File Name : 244_Get-TeamsResourceAccountsByDomain.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/244_Get-TeamsResourceAccountsByDomain.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineApplicationInstance")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsOnlineApplicationInstance)


$Result = @(
    $Items |
        ForEach-Object {
            $upn = [string](Get-TtProp -InputObject $_ -Path "UserPrincipalName")
            $domain = if ($upn -match "@") { $upn.Split("@")[-1] } else { "<Unknown>" }
            [pscustomobject]@{
                Domain = $domain
            }
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
