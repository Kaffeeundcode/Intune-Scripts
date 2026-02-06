<#
.SYNOPSIS
    Scans VMs with Public IPs for open management ports (RDP/SSH) to the internet.

.DESCRIPTION
    Iterates all VMs with Public IPs.
    Checks the effective Network Security Group (NSG) rules.
    Flags if port 3389 (RDP) or 22 (SSH) allows access from 'Any' or 'Internet'.

.NOTES
    File Name  : 127_Get-AzVMPublicIPInsecurePorts.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

Write-Host "Scanning Public IP exposure..." -ForegroundColor Cyan

$VMs = Get-AzVM -Status

$Report = @()

foreach ($VM in $VMs) {
    # Check if VM has public IP
    $NICs = $VM.NetworkProfile.NetworkInterfaces
    
    foreach ($NicRef in $NICs) {
        $Nic = Get-AzNetworkInterface -ResourceId $NicRef.Id
        
        if ($Nic.IpConfigurations.PublicIpAddress) {
            # Has Public IP
            # Check effective security rules (simplified check)
            
            # Note: For accurate "Only 0.0.0.0/0", we'd need Get-AzEffectiveNetworkSecurityGroup
            # Here we do a quick check of the attached NSG for obvious "Ah, RDP is open" rules.
            
            $NSG = $null
            if ($Nic.NetworkSecurityGroup) {
                $NSG = Get-AzNetworkSecurityGroup -ResourceId $Nic.NetworkSecurityGroup.Id
            }
            
            if ($NSG) {
                $UnsafeRules = $NSG.SecurityRules | Where-Object {
                    ($_.Access -eq "Allow") -and 
                    ($_.Direction -eq "Inbound") -and
                    ($_.SourceAddressPrefix -match "\*|0.0.0.0/0|Internet") -and
                    ($_.DestinationPortRange -match "3389|22")
                }
                
                if ($UnsafeRules) {
                    Write-Host " [RISK] $($VM.Name) has open ports!" -ForegroundColor Red
                    $Report += [PSCustomObject]@{
                        VMName = $VM.Name
                        PublicIP = "Yes"
                        OpenPorts = ($UnsafeRules.DestinationPortRange -join ",")
                    }
                }
            }
        }
    }
}

if ($Report.Count -gt 0) {
    $Report | Format-Table VMName, OpenPorts -AutoSize
    $Report | Export-Csv -Path "$PSScriptRoot\Insecure_Public_VMs.csv" -NoTypeInformation
} else {
    Write-Host "No obviously insecure public VMs found (via direct NSG check)." -ForegroundColor Green
}
