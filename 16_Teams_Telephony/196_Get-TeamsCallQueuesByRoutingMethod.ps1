<#
.SYNOPSIS
    Teams Call Queues By Routing Method

.DESCRIPTION
    Ruft Teams Call Queues By Routing Method aus der Teams-Telefonie ab.

.NOTES
    File Name : 196_Get-TeamsCallQueuesByRoutingMethod.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/196_Get-TeamsCallQueuesByRoutingMethod.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect


$Items = @(Get-CsCallQueue)
$Result = Group-TtByPath -Items $Items -Path "RoutingMethod" -Label "TeamsCallQueuesByRoutingMethod"

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
