<#
.SYNOPSIS
    Teams Call Queue Resource Accounts

.DESCRIPTION
    Exportiert Teams Call Queue Resource Accounts aus der Teams-Telefonie.

.NOTES
    File Name : 209_Export-TeamsCallQueueResourceAccounts.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/209_Export-TeamsCallQueueResourceAccounts.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    ResourceAccounts = "ResourceAccounts"
})


$Items = @(Get-CsCallQueue)

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Name)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
