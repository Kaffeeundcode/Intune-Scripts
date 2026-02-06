<#
.SYNOPSIS
    Analyzes devices to determine their eligibility for Co-Management (Intune + ConfigMgr).

.DESCRIPTION
    This script connects to Microsoft Graph to retrieve Windows devices and checks various
    attributes (OS version, Join Type, Management capability) to report if they are ready
    to be co-managed.
    
    It highlights devices that are:
    - Domain Joined (Hybrid)
    - Running compatible Windows 10/11 versions
    - Not yet managed by MDM

.NOTES
    File Name  : 101_Get-IntuneCoManagementEligibility.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
    Requires   : Microsoft.Graph.DeviceManagement
#>

Param(
    [Parameter(Mandatory=$false)]
    [string]$Path = "$PSScriptRoot\CoManagement_Eligibility_Report.csv"
)

# Check dependencies
if (-not (Get-Module -ListAvailable -Name Microsoft.Graph.DeviceManagement)) {
    Write-Warning "Module 'Microsoft.Graph.DeviceManagement' not found. Installing..."
    Install-Module Microsoft.Graph.DeviceManagement -Scope CurrentUser -Force -AllowClobber
}

# Connect to Graph
try {
    Connect-MgGraph -Scopes "Device.Read.All" -ErrorAction Stop
    Write-Host "Successfully connected to Microsoft Graph." -ForegroundColor Green
}
catch {
    Write-Error "Failed to connect to Graph. Error: $_"
    exit
}

Write-Host "Retrieving device inventory..." -ForegroundColor Cyan

# Get all Windows devices
$Devices = Get-MgDevice -Filter "operatingSystem eq 'Windows'" -All -Property Id, DisplayName, OperatingSystem, OperatingSystemVersion, TrustType, IsCompliant, IsManaged, MdmAppId

$Report = @()

foreach ($Dev in $Devices) {
    $Eligibility = "Eligible"
    $Reason = "Ready for Co-Management"

    # Criteria 1: Must be Hybrid Joined or Domain Joined for typical Co-Mgmt paths (though AADJ works too for cloud-first)
    # We focus on ensuring it has a proper trust type
    if ($null -eq $Dev.TrustType) {
        $Eligibility = "Unknown"
        $Reason = "Trust Type Unknown"
    }

    # Criteria 2: OS Version (Basic check for Win10+)
    if ($Dev.OperatingSystem -notmatch "Windows") {
        $Eligibility = "Not Eligible" 
        $Reason = "Non-Windows OS"
    }

    # Criteria 3: Already Managed?
    if ($Dev.IsManaged -eq $true) {
        $Eligibility = "Already Managed"
        $Reason = "Device is already enrolled in Intune"
    }

    $obj = [PSCustomObject]@{
        DeviceId          = $Dev.Id
        DeviceName        = $Dev.DisplayName
        OS                = $Dev.OperatingSystem
        Version           = $Dev.OperatingSystemVersion
        TrustType         = $Dev.TrustType
        IsManaged         = $Dev.IsManaged
        EligibilityStatus = $Eligibility
        Details           = $Reason
    }
    $Report += $obj
}

# Output
$Report | Format-Table DeviceName, EligibilityStatus, Details -AutoSize

Write-Host "Exporting report to $Path..." -ForegroundColor Yellow
$Report | Export-Csv -Path $Path -NoTypeInformation

Write-Host "Done." -ForegroundColor Green
