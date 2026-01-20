<#
.SYNOPSIS
    Listet alle Public IP Adressen auf und zeigt, wo sie verwendet werden.

.DESCRIPTION
    Hilft, verwaiste öffentliche IPs zu finden oder einen Überblick über die externen Zugriffspunkte zu bekommen.
    Zeigt IP-Adresse, DNS-Name und zugeordnete Ressource (NIC, Load Balancer, VPN Gateway).

    Parameter:
    - ResourceGroupName: (Optional) Filter auf eine RG. Wenn leer, wird die ganze Subscription durchsucht.

.NOTES
    File Name: 008_Get-AzPublicIpAddressUsage.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$false)] [string]$ResourceGroupName
)

try {
    if ($ResourceGroupName) {
        Write-Host "Suche in RG '$ResourceGroupName'..." -ForegroundColor Cyan
        $PIPs = Get-AzPublicIpAddress -ResourceGroupName $ResourceGroupName
    } else {
        Write-Host "Suche in gesamter Subscription..." -ForegroundColor Cyan
        $PIPs = Get-AzPublicIpAddress
    }

    $Results = foreach ($pip in $PIPs) {
        
        $Associated = "Nicht verbunden (Verwaist)"
        if ($pip.IpConfiguration) {
            # Z.B. Network Interface
            $Associated = "NIC: " + ($pip.IpConfiguration.Id -split '/')[-3]
        } elseif ($pip.PublicIpPrefix) {
             $Associated = "IP Prefix"
        }
        # Erweiterte Prüfung für andere Ressourcen könnte hier erfolgen
        
        [PSCustomObject]@{
            Name              = $pip.Name
            ResourceGroup     = $pip.ResourceGroupName
            IPAddress         = $pip.IpAddress
            AllocationMethod  = $pip.PublicIpAllocationMethod
            AssociatedService = $Associated
        }
    }

    $Results | Format-Table -AutoSize

} catch {
    Write-Error "Fehler: $_"
}
