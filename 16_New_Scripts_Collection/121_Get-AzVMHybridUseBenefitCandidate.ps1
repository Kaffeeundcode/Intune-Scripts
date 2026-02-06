<#
.SYNOPSIS
    Identifies Windows VMs that are NOT using the Azure Hybrid Benefit (AHB).

.DESCRIPTION
    Running Windows Server in Azure is cheaper if you bring your own license (AHB).
    This script finds VMs with 'Windows' OS where LicenseType is null or not 'Windows_Server',
    indicating potential cost savings.

.NOTES
    File Name  : 121_Get-AzVMHybridUseBenefitCandidate.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-AzAccount -ErrorAction Stop
} catch {
    Write-Error "Login failed. Run Connect-AzAccount."
    exit
}

Write-Host "Scanning VMs for Hybrid Benefit status..." -ForegroundColor Cyan
$VMs = Get-AzVM -Status

$Report = @()

foreach ($VM in $VMs) {
    # Check if OS is Windows
    if ($VM.StorageProfile.OsDisk.OsType -eq "Windows") {
        
        $LicenseType = $VM.LicenseType
        $Status = "Using AHB"
        
        if ([string]::IsNullOrWhiteSpace($LicenseType)) {
            $Status = "NOT Using AHB (Cost saving opportunity)"
        }
        
        $obj = [PSCustomObject]@{
            VMName = $VM.Name
            ResourceGroup = $VM.ResourceGroupName
            Size = $VM.HardwareProfile.VmSize
            LicenseType = if ($LicenseType) { $LicenseType } else { "PAYG (None)" }
            Status = $Status
        }
        $Report += $obj
    }
}

$Report | Sort-Object Status | Format-Table VMName, Size, LicenseType, Status -AutoSize

$Path = "$PSScriptRoot\AHB_Candidate_Report.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
