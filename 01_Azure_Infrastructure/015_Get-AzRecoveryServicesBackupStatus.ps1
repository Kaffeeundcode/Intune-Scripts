<#
.SYNOPSIS
    Prüft den Backup-Status aller VMs in einem Recovery Services Vault.

.DESCRIPTION
    Zeigt an, welche VMs geschützt sind, wann das letzte Backup lief und ob es Fehler gab.
    
    Parameter:
    - ResourceGroupName: RG des Vaults
    - VaultName: Name des Recovery Services Vault

.NOTES
    File Name: 015_Get-AzRecoveryServicesBackupStatus.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$ResourceGroupName,
    [Parameter(Mandatory=$true)] [string]$VaultName
)

try {
    Write-Host "Verbinde mit Vault '$VaultName'..." -ForegroundColor Cyan
    $Vault = Get-AzRecoveryServicesVault -ResourceGroupName $ResourceGroupName -Name $VaultName -ErrorAction Stop
    Set-AzRecoveryServicesVaultContext -Vault $Vault -ErrorAction Stop | Out-Null

    Write-Host "Suche Backup Items (Azure IaaS VM)..." -ForegroundColor Cyan
    $Items = Get-AzRecoveryServicesBackupItem -WorkloadType AzureVM -BackupManagementType AzureVM

    foreach ($item in $Items) {
        $Status = $item.LastBackupStatus
        $Color = if ($Status -eq "Completed") { "Green" } else { "Red" }
        
        Write-Host "VM: $($item.Name)" -ForegroundColor Yellow
        Write-Host " - Status:        $Status" -ForegroundColor $Color
        Write-Host " - Letztes Backup: $($item.LastBackupTime)"
        Write-Host " - Policy:        $($item.ProtectionPolicyName)"
    }

} catch {
    Write-Error "Fehler: $_"
}
