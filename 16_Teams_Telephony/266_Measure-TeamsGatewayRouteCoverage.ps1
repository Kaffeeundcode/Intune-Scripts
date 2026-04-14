<#
.SYNOPSIS
    Teams Gateway Route Coverage

.DESCRIPTION
    Misst Teams Gateway Route Coverage in der Teams-Telefonie.

.NOTES
    File Name : 266_Measure-TeamsGatewayRouteCoverage.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/266_Measure-TeamsGatewayRouteCoverage.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlinePSTNGateway", "Get-CsVoiceRoute")
Initialize-TtSession -SkipConnect:$SkipConnect

$Items = @(Get-CsVoiceRoute)


$gateways = @(Get-CsOnlinePSTNGateway)
$routes = @(Get-CsVoiceRoute)
$Result = @(
    [pscustomobject]@{ Metric = "Gateways"; Count = $gateways.Count }
    [pscustomobject]@{ Metric = "Routes"; Count = $routes.Count }
    [pscustomobject]@{ Metric = "RoutesWithGateway"; Count = (@($routes | Where-Object { Get-TtProp -InputObject $_ -Path "OnlinePstnGatewayList.Count" })).Count }
    [pscustomobject]@{ Metric = "RoutesWithoutGateway"; Count = (@($routes | Where-Object { -not (Get-TtProp -InputObject $_ -Path "OnlinePstnGatewayList.Count") })).Count }
)


if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
