<#
.SYNOPSIS
    Zeigt detaillierte Lizenzinformationen (welche Service Pläne sind aktiv) für einen User.

.DESCRIPTION
    Eine "E5" Lizenz hat viele Unterkomponenten (Intune, Exchange, Teams...).
    Dieses Skript zeigt genau, welche Dienste für einen User AKTIViert sind.

    Parameter:
    - UserPrincipalName: Der Benutzer.

.NOTES
    File Name: 067_Get-M365LicensingGranularDetails.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [Parameter(Mandatory=$true)] [string]$UserPrincipalName
)

try {
    Write-Host "Analysiere Lizenzen für '$UserPrincipalName'..." -ForegroundColor Cyan
    
    $User = Get-MgUser -UserId $UserPrincipalName -Property AssignedLicenses -ErrorAction Stop
    
    if (-not $User.AssignedLicenses) {
        Write-Warning "Keine Lizenzen zugewiesen."
        exit
    }

    # SkuId in Namen aufzulösen braucht Mapping-Liste oder Graph Call auf SubscribedSkus
    $AllSkus = Get-MgSubscribedSku -All
    
    foreach ($lic in $User.AssignedLicenses) {
        $SkuName = ($AllSkus | Where-Object SkuId -eq $lic.SkuId).SkuPartNumber
        Write-Host "Lizenz: $SkuName" -ForegroundColor Yellow
        
        # Disabled Plans anzeigen
        if ($lic.DisabledPlans.Count -gt 0) {
            Write-Host " - Deaktivierte Dienste:"
            foreach ($dp in $lic.DisabledPlans) {
                # Service Plan Name auflösen wäre komplexer, hier ID
                Write-Host "   * Plan ID: $dp" 
            }
        } else {
            Write-Host " - Alle Dienste aktiv."
        }
    }

} catch {
    Write-Error "Fehler: $_"
}
