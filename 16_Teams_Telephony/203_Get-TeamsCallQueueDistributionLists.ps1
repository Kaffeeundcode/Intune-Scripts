<#
.SYNOPSIS
    Teams Call Queue Distribution Lists

.DESCRIPTION
    Ruft Teams Call Queue Distribution Lists aus der Teams-Telefonie ab.

.NOTES
    File Name : 203_Get-TeamsCallQueueDistributionLists.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/203_Get-TeamsCallQueueDistributionLists.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsCallQueue")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Name = "Name"
    DistributionListCount = "DistributionLists.Count"
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
