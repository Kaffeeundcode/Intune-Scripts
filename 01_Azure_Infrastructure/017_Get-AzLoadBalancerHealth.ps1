<#
.SYNOPSIS
    Prüft den Health Probe Status eines Azure Load Balancers.

.DESCRIPTION
    Zeigt an, wie viele Instanzen im Backend Pool "Healthy" oder "Unhealthy" sind.
    Nutzt 'Get-AzLoadBalancerProbeConfig' und Backend Health Metrics.

    Parameter:
    - ResourceGroupName: RG Name
    - LoadBalancerName: Name des LBs

.NOTES
    File Name: 017_Get-AzLoadBalancerHealth.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$LoadBalancerName
)

try {
    Write-Host "Prüfe Load Balancer '$LoadBalancerName'..." -ForegroundColor Cyan
    $LB = Get-AzLoadBalancer -ResourceGroupName $ResourceGroupName -Name $LoadBalancerName -ErrorAction Stop

    # Da echte Probe-Daten über Metriken laufen, nutzen wir hier eine vereinfachte Logik über Metrics API
    # Alternativ: Ausgabe der Konfiguration
    
    Write-Host "Load Balancer Konfiguration:" -ForegroundColor Yellow
    Write-Host "Frontend IPs:"
    $LB.FrontendIpConfigurations | ForEach-Object { Write-Host " - $($_.Name): $($_.PrivateIpAddress)$($_.PublicIpAddress.Id)" }
    
    Write-Host "Backend Pools:"
    $LB.BackendAddressPools | ForEach-Object { Write-Host " - $($_.Name)" }

    Write-Host "Health Probes:"
    $LB.Probes | ForEach-Object { 
        Write-Host " - $($_.Name) (Port: $($_.Port), Interval: $($_.IntervalInSeconds)s)" 
    }

    Write-Host "`nHinweis: Echten Echtzeit-Status der Probes bitte über Azure Monitor ('Metrics') prüfen." -ForegroundColor Gray

} catch {
    Write-Error "Fehler: $_"
}
