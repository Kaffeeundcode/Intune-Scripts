<#
.SYNOPSIS
    Teams Voice Routing Policies Without Routes

.DESCRIPTION
    Identifiziert Teams Voice Routing Policies Without Routes in der Teams-Telefonie.

.NOTES
    File Name : 264_Find-TeamsVoiceRoutingPoliciesWithoutRoutes.ps1
    Author    : Kaffeeundcode
    Version   : 1.0
#>

param(
    [string]$OutputPath = "$PSScriptRoot/264_Find-TeamsVoiceRoutingPoliciesWithoutRoutes.csv",
    [int]$Top = 25,
    [switch]$SkipConnect
)

. "$PSScriptRoot/000_TeamsTelephonyHelper.ps1"

Ensure-TtCommand -Commands @("Get-CsOnlineVoiceRoutingPolicy")
Initialize-TtSession -SkipConnect:$SkipConnect

$PropertyMap = ([ordered]@{
    Identity = "Identity"
    PstnUsageCount = "OnlinePstnUsages.Count"
    Description = "Description"
})


$Items = @(Get-CsOnlineVoiceRoutingPolicy)

$Items = Where-TtMissingValue -Items $Items -Path "OnlinePstnUsages.Count"

$Result = Select-TtProps -Items $Items -PropertyMap $PropertyMap

$Result = @($Result | Sort-Object Identity)

if ($OutputPath) {
    Export-TtData -Data $Result -OutputPath $OutputPath
    Write-Host "Export abgeschlossen: $OutputPath" -ForegroundColor Green
} else {
    Write-TtPreview -Data $Result -Top $Top
}
