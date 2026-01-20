<#
.SYNOPSIS
    Konfiguriert automatisches Key-Rotation Policy Template für einen KeyVault Key.

.DESCRIPTION
    Aktiviert Rotation (z.B. alle 90 Tage).
    Hinweis: Dies ist ein komplexes Feature, dieses Skript setzt eine Standard-Policy. 
    Nur für Keys, nicht für Secrets!

    Parameter:
    - VaultName: KeyVault
    - KeyName: Name des Keys

.NOTES
    File Name: 089_Set-AzKeyVaultKeyRotation.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$VaultName,
    [Parameter(Mandatory=$true)] [string]$KeyName
)

try {
    Write-Host "Konfiguriere Rotation Policy für '$KeyName'..." -ForegroundColor Cyan

    # Beispiel JSON Policy für 90 Tage Rotation, 30 Tage vor Ablauf Notification
    # Achtung: Benötigt Az.KeyVault > 4.x
    
    $Policy = @{
        "lifetimeActions" = @(
            @{
                "trigger" = @{ "timeAfterCreate" = "P90D" }
                "action" = @{ "type" = "Rotate" }
            }
            @{
                "trigger" = @{ "timeBeforeExpiry" = "P30D" }
                "action" = @{ "type" = "Notify" }
            }
        )
        "attributes" = @{
            "expiryTime" = "P180D"
        }
    }
    
    # Set-AzKeyVaultKeyRotationPolicy ist neu, falls nicht da, Warnung
    if (Get-Command Set-AzKeyVaultKeyRotationPolicy -ErrorAction SilentlyContinue) {
        Set-AzKeyVaultKeyRotationPolicy -VaultName $VaultName -Name $KeyName -Policy $Policy -ErrorAction Stop
        Write-Host "Rotation Policy aktiviert." -ForegroundColor Green
    } else {
        Write-Warning "Cmdlet 'Set-AzKeyVaultKeyRotationPolicy' nicht gefunden. Bitte Az Modul aktualisieren."
    }

} catch {
    Write-Error "Fehler: $_"
}
