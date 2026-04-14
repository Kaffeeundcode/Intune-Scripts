<#
.SYNOPSIS
    Identifies Network Security Groups (NSGs) that are not associated with any Subnet or Network Interface.

.DESCRIPTION
    Orphaned NSGs clutter the environment and provide no value.
    This script checks the 'Subnets' and 'NetworkInterfaces' properties of every NSG.

.NOTES
    File Name  : 123_Get-AzNetworkOrphanedNSGs.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Write-Host "Getting NSGs..." -ForegroundColor Cyan
$NSGs = Get-AzNetworkSecurityGroup

$Report = @()

foreach ($NSG in $NSGs) {
    $Subnets = $NSG.Subnets.Count
    $NICs = $NSG.NetworkInterfaces.Count
    
    if ($Subnets -eq 0 -and $NICs -eq 0) {
        Write-Host "Orphaned: $($NSG.Name)" -ForegroundColor Yellow
        $Report += [PSCustomObject]@{
            NSGName = $NSG.Name
            ResourceGroup = $NSG.ResourceGroupName
            Location = $NSG.Location
            Status = "Orphaned (No Subnets/NICs)"
        }
    }
}

if ($Report.Count -gt 0) {
    $Report | Format-Table NSGName, ResourceGroup, Status -AutoSize
    $Path = "$PSScriptRoot\Orphaned_NSGs.csv"
    $Report | Export-Csv -Path $Path -NoTypeInformation
} else {
    Write-Host "No orphaned NSGs found." -ForegroundColor Green
}
