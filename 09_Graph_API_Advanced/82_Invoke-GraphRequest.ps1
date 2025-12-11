<#
.SYNOPSIS
    Invokes a raw Microsoft Graph Request.
    
.DESCRIPTION
    Useful for Beta endpoints or features not yet in the PowerShell module.
    
.NOTES
    File Name: 82_Invoke-GraphRequest.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$Uri,

    [ValidateSet("GET","POST","PATCH","DELETE","PUT")]
    [string]$Method = "GET",

    [Hashtable]$Body
)

Connect-MgGraph -Scopes "DeviceManagementManagedDevices.Read.All" -ErrorAction SilentlyContinue

try {
    if ($Body) {
        $Result = Invoke-MgGraphRequest -Method $Method -Uri $Uri -Body $Body
    } else {
        $Result = Invoke-MgGraphRequest -Method $Method -Uri $Uri
    }
    
    return $Result
} catch {
    Write-Error "Graph Request Failed: $_"
}
