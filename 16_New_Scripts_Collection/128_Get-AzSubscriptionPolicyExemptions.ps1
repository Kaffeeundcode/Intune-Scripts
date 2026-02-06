<#
.SYNOPSIS
    Lists all Azure Policy Exemptions in the subscription.

.DESCRIPTION
    Exemptions act as "Get out of jail free" cards for compliance.
    This script audits all exemptions to ensure they are still valid/necessary.

.NOTES
    File Name  : 128_Get-AzSubscriptionPolicyExemptions.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-AzAccount -ErrorAction Stop
} catch {
    Write-Error "Login failed."
    exit
}

Write-Host "Getting Policy Exemptions..." -ForegroundColor Cyan

# Requires Az.Resources module
$Exemptions = Get-AzPolicyExemption

$Report = @()

foreach ($Ex in $Exemptions) {
    $Report += [PSCustomObject]@{
        ExemptionName = $Ex.Name
        DisplayName   = $Ex.DisplayName
        Scope         = $Ex.Scope
        PolicyAssignmentId = $Ex.PolicyAssignmentId
        Category      = $Ex.ExemptionCategory
        ExpiresOn     = $Ex.ExpiresOn
    }
}

if ($Report.Count -gt 0) {
    $Report | Format-Table DisplayName, Scope, Category, ExpiresOn -AutoSize
    $Report | Export-Csv "$PSScriptRoot\Policy_Exemptions.csv" -NoTypeInformation
    Write-Host "Report saved." -ForegroundColor Green
} else {
    Write-Host "No policy exemptions found." -ForegroundColor Green
}
