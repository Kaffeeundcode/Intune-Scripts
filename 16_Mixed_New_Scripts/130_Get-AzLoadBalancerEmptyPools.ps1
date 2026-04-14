<#
.SYNOPSIS
    Identifies Load Balancers that have no backend pool members defined.

.DESCRIPTION
    An empty Load Balancer incurs costs (Standard SKU) and adds complexity.
    This script flags LBs with 0 backend servers.

.NOTES
    File Name  : 130_Get-AzLoadBalancerEmptyPools.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Write-Host "Checking Load Balancers..." -ForegroundColor Cyan
$LBs = Get-AzLoadBalancer

$Report = @()

foreach ($LB in $LBs) {
    $MemberCount = 0
    if ($LB.BackendAddressPools) {
        foreach ($Pool in $LB.BackendAddressPools) {
            $MemberCount += $Pool.BackendIpConfigurations.Count
        }
    }
    
    $Status = "Active"
    if ($MemberCount -eq 0) { $Status = "Empty (Unused)" }
    
    $Report += [PSCustomObject]@{
        LBName = $LB.Name
        Sku = $LB.Sku.Name
        BackendCount = $MemberCount
        Status = $Status
    }
}

$Report | Sort-Object BackendCount | Format-Table LBName, Sku, BackendCount, Status -AutoSize
$Report | Export-Csv "$PSScriptRoot\LB_Usage_Report.csv" -NoTypeInformation
