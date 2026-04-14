<#
.SYNOPSIS
    Teams Call Queue Routing Modes

.DESCRIPTION
    Vergleicht Teams Call Queue Routing Modes in der Teams-Telefonie.

.NOTES
    File Name : 204_Compare-TeamsCallQueueRoutingModes.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/204_Compare-TeamsCallQueueRoutingModes.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsCallQueue)


$Result = @(
    $Items |
        ForEach-Object {
            [pscustomobject]@{
                RoutingProfile = "{0}|Presence:{1}" -f (Get-TtProp -InputObject $_ -Path "RoutingMethod"), (Get-TtProp -InputObject $_ -Path "PresenceBasedRouting")
            }
        } |
        Group-Object RoutingProfile |
        Sort-Object Count -Descending |
        ForEach-Object {
            [pscustomobject]@{
                RoutingProfile = $_.Name
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
