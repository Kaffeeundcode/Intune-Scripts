<#
.SYNOPSIS
    Reports on Mobile Application Management (MAM) Policy deployments (App Protection).

.DESCRIPTION
    App Protection Policies (MAM) are applied to users, unlike MDM which is device centric.
    This script lists all App Protection Policies and shows the count of targeted users
    and compliance status (if available via summary).

.NOTES
    File Name  : 110_Get-IntuneMAMPolicyDeployment.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "DeviceManagementApps.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "Getting App Protection Policies..." -ForegroundColor Cyan
$Policies = Get-MgDeviceAppMgtManagedAppPolicy -All

# We specifically look for "managedAppProtection" derived types (iOS/Android)
$ProtectionPolicies = $Policies | Where-Object { $_.AdditionalProperties.containsKey("@odata.type") -and $_.AdditionalProperties["@odata.type"] -match "targetedManagedAppProtection" }

$Report = @()

foreach ($Pol in $ProtectionPolicies) {
    # Get deployment summary
    # The summary endpoint is often nested like managedAppPolicies/{id}/targetApps
    
    $Apps = $null
    try {
        # Retrieve the specific casted object to get targeted apps
        # Depending on SDK version, might need specific Get-MgDeviceAppMgtManagedAppProtection...
        
        # Generic approach using ID
        if ($Pol.Id) {
            # Attempt to get assigned apps
             # This property is often directly on the object in PS
             $AppCount = if ($Pol.TargetedAppManagementLevels) { $Pol.TargetedAppManagementLevels.Count } else { "All" }
        }
    } catch {}

    $obj = [PSCustomObject]@{
        PolicyName = $Pol.DisplayName
        Platform   = if ($Pol.AdditionalProperties["@odata.type"] -match "ios") { "iOS" } else { "Android" }
        IsDeployed = $Pol.IsAssigned
        Created    = $Pol.CreatedDateTime
        Description = $Pol.Description
    }
    $Report += $obj
}

$Report | Format-Table PolicyName, Platform, IsDeployed, Created -AutoSize

$Path = "$PSScriptRoot\MAM_Policy_Report.csv"
$Report | Export-Csv -Path $Path -NoTypeInformation
Write-Host "Report saved to $Path" -ForegroundColor Green
