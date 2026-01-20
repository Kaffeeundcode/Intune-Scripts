<#
.SYNOPSIS
    Zeigt die Belegung von Subnetzen in einem virtuellen Netzwerk an.

.DESCRIPTION
    Hilft bei der Planung von neuen Deployments, um sicherzustellen, dass genügend IP-Adressen im Subnetz frei sind.
    
    Parameter:
    - ResourceGroupName: RG Name
    - VNetName: Name des VNet

.NOTES
    File Name: 013_Get-AzVNetSubnetUsage.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$VNetName
)

try {
    $VNet = Get-AzVirtualNetwork -ResourceGroupName $ResourceGroupName -Name $VNetName -ErrorAction Stop
    
    Write-Host "Analyse der Subnetze in '$VNetName'..." -ForegroundColor Cyan

    foreach ($subnet in $VNet.Subnets) {
        # Azure reserviert immer 5 IPs pro Subnetz
        # Berechnung der totalen IPs basierend auf CIDR
        $Prefix = $subnet.AddressPrefix
        $Cidr =  [int]($Prefix -split '/')[1]
        $TotalIPs = [Math]::Pow(2, (32 - $Cidr)) - 5 
        
        # IpConfigurations enthält die verbundenen Interfaces
        $UsedIPs = $subnet.IpConfigurations.Count
        $FreeIPs = $TotalIPs - $UsedIPs

        # % Nutzung
        $PercentUsed = [Math]::Round(($UsedIPs / $TotalIPs) * 100, 2)

        Write-Host "Subnetz: $($subnet.Name) ($Prefix)" -ForegroundColor Yellow
        Write-Host " - Total nutzbar: $TotalIPs"
        Write-Host " - Belegt:        $UsedIPs"
        Write-Host " - Frei:          $FreeIPs"
        Write-Host " - Auslastung:    $PercentUsed %"
        Write-Host "--------------------------------"
    }

} catch {
    Write-Error "Fehler: $_"
}
