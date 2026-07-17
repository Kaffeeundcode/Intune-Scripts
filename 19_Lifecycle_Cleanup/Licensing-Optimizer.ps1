<#
.SYNOPSIS
    Licensing-Optimizer - Reports on unassigned or unused license seats.
    
.DESCRIPTION
    Identifies licensed users who are not utilizing their assigned 
    services or where licenses are assigned but not activated.
#>

[CmdletBinding()]
param ()

process {
    Write-Host "[INFO] Analyzing license utilization..." -ForegroundColor Cyan
    
    try {
        # Get all subscribed SKUs
        $Skus = Get-MgSubscribedSku -All
        $Report = @()

        foreach ($Sku in $Skus) {
            $Consumed = $Sku.ConsumedUnits
            $Enabled = $Sku.EnabledUnits
            $Waste = $Enabled - $Consumed
            
            $Report += [PSCustomObject]@{
                SkuName = $Sku.SkuPartNumber
                TotalEnabled = $Enabled
                Consumed = $Consumed
                Waste = $Waste
                Utilization = "{0:P2}" -f ($Consumed / $Enabled)
            }
        }

        $Report | Sort-Object Waste -Descending | Format-Table
        Write-Host "[INFO] License report generated. Check 'Waste' column for potential savings." -ForegroundColor Gray
    } catch {
        Write-Error "Failed to fetch licensing data: $($_.Exception.Message)"
    }
}