<#
.SYNOPSIS
    Calculates the density of App Services running per App Service Plan.

.DESCRIPTION
    App Service Plans (ASP) are the billing unit.
    If you have many ASPs with only 1 App each, you are paying for unused compute.
    This script finds ASPs with low density (e.g. < 2 apps) to suggest consolidation.

.NOTES
    File Name  : 126_Get-AzAppServicePlanDensity.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-AzAccount -ErrorAction Stop
} catch {
    Write-Error "Login failed."
    exit
}

Write-Host "Getting App Service Plans..." -ForegroundColor Cyan
$Plans = Get-AzAppServicePlan

$Report = @()

foreach ($Plan in $Plans) {
    # Count apps associated
    # Method varies by module version, standard is to query Get-AzWebApp with plan ID
    $Apps = Get-AzWebApp -ResourceGroupName $Plan.ResourceGroup | Where-Object { $_.ServerFarmId -eq $Plan.Id }
    $AppCount = $Apps.Count
    
    $Status = "Optimized"
    if ($AppCount -eq 0) { $Status = "Empty (Cost Waster)" }
    elseif ($AppCount -eq 1) { $Status = "Low Density (Consider Compacting)" }
    
    $Report += [PSCustomObject]@{
        PlanName = $Plan.Name
        ResourceGroup = $Plan.ResourceGroup
        Tier = $Plan.Sku.Tier
        Size = $Plan.Sku.Size
        AppCount = $AppCount
        Status = $Status
    }
}

$Report | Sort-Object AppCount | Format-Table PlanName, Tier, AppCount, Status -AutoSize
$Path = "$PSScriptRoot\ASP_Density_Report.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
