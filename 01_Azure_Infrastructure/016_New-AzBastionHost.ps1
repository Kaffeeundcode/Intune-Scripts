<#
.SYNOPSIS
    Erstellt einen Azure Bastion Host für sicheren VM-Zugriff.

.DESCRIPTION
    Azure Bastion ermöglicht RDP/SSH-Zugriff über SSL ohne Public IPs an den VMs.
    Dieses Skript erstellt den Bastion Host inkl. Public IP.
    Benötigt ein Subnetz namens 'AzureBastionSubnet' (min. /26).

    Parameter:
    - ResourceGroupName: RG Name
    - BastionName: Name des Bastion Service
    - VNetName: Name des Ziel-VNets
    - Location: Region

.NOTES
    File Name: 016_New-AzBastionHost.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$BastionName,
    [Parameter(Mandatory=$true)] [string]$VNetName,
    [Parameter(Mandatory=$true)] [string]$Location
)

try {
    Write-Host "Prüfe Subnetz..." -ForegroundColor Cyan
    $VNet = Get-AzVirtualNetwork -ResourceGroupName $ResourceGroupName -Name $VNetName -ErrorAction Stop
    $Subnet = $VNet.Subnets | Where-Object Name -eq "AzureBastionSubnet"

    if (-not $Subnet) {
        Throw "Subnetz 'AzureBastionSubnet' fehlt im VNet '$VNetName'. Bitte erstellen Sie dieses zuerst (min. /26)."
    }

    Write-Host "Erstelle Public IP für Bastion..." -ForegroundColor Cyan
    $Pip = New-AzPublicIpAddress -ResourceGroupName $ResourceGroupName `
                                 -Name "$BastionName-PIP" `
                                 -Location $Location `
                                 -AllocationMethod Static `
                                 -Sku Standard `
                                 -ErrorAction Stop

    Write-Host "Erstelle Bastion Host '$BastionName' (Das kann 5-10 Minuten dauern)..." -ForegroundColor Cyan
    New-AzBastion -ResourceGroupName $ResourceGroupName `
                  -Name $BastionName `
                  -PublicIpAddress $Pip `
                  -VirtualNetwork $VNet `
                  -ErrorAction Stop | Out-Null

    Write-Host "Bastion Host erfolgreich erstellt." -ForegroundColor Green

} catch {
    Write-Error "Fehler: $_"
}
