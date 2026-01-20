<#
.SYNOPSIS
    Erstellt ein VNet-Peering zwischen zwei virtuellen Netzwerken in Azure.

.DESCRIPTION
    Dieses Skript verbindet zwei VNets (Source und Destination) über ein Peering.
    Es prüft, ob die VNets existieren und führt das Peering in BEIDE Richtungen aus (Bidirektional), 
    da ein Peering immer zweiseitig konfiguriert werden muss, um zu funktionieren.

    Parameter:
    - SourceResourceGroup: RG des ersten VNets
    - SourceVNetName: Name des ersten VNets
    - DestResourceGroup: RG des zweiten VNets
    - DestVNetName: Name des zweiten VNets

.NOTES
    File Name: 002_New-AzVNetPeeringConfig.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$SourceResourceGroup,
    [Parameter(Mandatory=$true)] [string]$SourceVNetName,
    [Parameter(Mandatory=$true)] [string]$DestResourceGroup,
    [Parameter(Mandatory=$true)] [string]$DestVNetName
)

try {
    Write-Host "Prüfe VNets..." -ForegroundColor Cyan
    
    $vnet1 = Get-AzVirtualNetwork -Name $SourceVNetName -ResourceGroupName $SourceResourceGroup -ErrorAction Stop
    $vnet2 = Get-AzVirtualNetwork -Name $DestVNetName -ResourceGroupName $DestResourceGroup -ErrorAction Stop

    Write-Host " VNets gefunden. Starte Peering..." -ForegroundColor Cyan

    # Peering 1 -> 2
    Add-AzVirtualNetworkPeering -Name "$SourceVNetName-to-$DestVNetName" `
                                -VirtualNetwork $vnet1 `
                                -RemoteVirtualNetworkId $vnet2.Id `
                                -AllowVirtualNetworkAccess `
                                -AllowForwardedTraffic `
                                -ErrorAction Stop | Out-Null
    Write-Host " -> Peering '$SourceVNetName-to-$DestVNetName' erstellt." -ForegroundColor Green

    # Peering 2 -> 1 (Gegenrichtung wichtig!)
    Add-AzVirtualNetworkPeering -Name "$DestVNetName-to-$SourceVNetName" `
                                -VirtualNetwork $vnet2 `
                                -RemoteVirtualNetworkId $vnet1.Id `
                                -AllowVirtualNetworkAccess `
                                -AllowForwardedTraffic `
                                -ErrorAction Stop | Out-Null
    Write-Host " -> Peering '$DestVNetName-to-$SourceVNetName' erstellt." -ForegroundColor Green

    Write-Host "Peering vollständig eingerichtet und aktiv." -ForegroundColor Green

} catch {
    Write-Error "Fehler beim Erstellen des Peerings: $_"
}
