<#
.SYNOPSIS
    Prüft, ob für eine Azure VM der Auto-Shutdown konfiguriert ist.

.DESCRIPTION
    Auto-Shutdown hilft Kosten zu sparen, besonders bei Dev/Test-Maschinen.
    Dieses Skript prüft den Status der Auto-Shutdown-Schedule für eine VM.

    Parameter:
    - ResourceGroupName: Die Ressourcengruppe der VM
    - VMName: Name der VM

.NOTES
    File Name: 004_Get-AzVMAutoShutdownStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$VMName
)

try {
    # Auto-Shutdown ist in Azure eine Ressource vom Typ 'microsoft.devtestlab/schedules' 
    # und hat meist den Namen "shutdown-computevm-<VMName>"
    
    $ScheduleName = "shutdown-computevm-$VMName"
    
    Write-Host "Suche Auto-Shutdown Schedule für '$VMName'..." -ForegroundColor Cyan
    
    $Schedule = Get-AzResource -ResourceGroupName $ResourceGroupName -Name $ScheduleName -ResourceType "microsoft.devtestlab/schedules" -ErrorAction SilentlyContinue

    if ($Schedule) {
        $Props = $Schedule.Properties
        Write-Host "Auto-Shutdown gefunden!" -ForegroundColor Green
        Write-Host " Status:       $($Props.status)"
        Write-Host " Zeit:         $($Props.dailyRecurrence.time)"
        Write-Host " Zeitzone:     $($Props.timeZoneId)"
    } else {
        Write-Warning "Kein Auto-Shutdown Schedule für VM '$VMName' in RG '$ResourceGroupName' gefunden."
        Write-Host "Hinweis: Dies könnte bedeuten, dass die VM 24/7 läuft und Kosten verursacht."
    }

} catch {
    Write-Error "Fehler bei der Abfrage: $_"
}
