<#
.SYNOPSIS
    Prüft den Status der NSG Flow Logs für Network Security Groups.

.DESCRIPTION
    Network Security Group (NSG) Flow Logs ermöglichen es, Traffic-Muster zu analysieren.
    Dieses Skript listet alle NSGs in einer Resource Group auf und zeigt, ob Flow Logs aktiviert sind.
    
    Voraussetzung: Network Watcher muss in der Region aktiv sein.

    Parameter:
    - ResourceGroupName: Name der Ressourcengruppe mit den NSGs
    - NetworkWatcherName: Name des Network Watchers
    - NetworkWatcherRG: RG des Network Watchers

.NOTES
    File Name: 006_Get-AzNetworkSecurityGroupFlowLogs.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$NetworkWatcherName,
    [Parameter(Mandatory=$true)] [string]$NetworkWatcherRG
)

try {
    $NetworkWatcher = Get-AzNetworkWatcher -Name $NetworkWatcherName -ResourceGroupName $NetworkWatcherRG -ErrorAction Stop
    $NSGs = Get-AzNetworkSecurityGroup -ResourceGroupName $ResourceGroupName

    foreach ($nsg in $NSGs) {
        try {
            $Status = Get-AzNetworkWatcherFlowLogStatus -NetworkWatcher $NetworkWatcher -TargetResourceId $nsg.Id -ErrorAction Stop
            
            Write-Host "NSG: $($nsg.Name)" -NoNewline
            if ($Status.Enabled) {
                Write-Host " [AKTIV]" -ForegroundColor Green
                Write-Host " - Storage ID: $($Status.StorageId)"
                Write-Host " - Retention:  $($Status.RetentionPolicy.Days) Tage"
            } else {
                Write-Host " [INAKTIV]" -ForegroundColor Red
            }
        } catch {
            Write-Warning "Konnte Flow Log Status für '$($nsg.Name)' nicht abrufen: $_"
        }
    }

} catch {
    Write-Error "Fehler: $_"
}
