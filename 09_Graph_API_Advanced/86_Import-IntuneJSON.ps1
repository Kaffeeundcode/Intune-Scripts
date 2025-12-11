<#
.SYNOPSIS
    Imports/Creates Policy from JSON.
    
.DESCRIPTION
    Reads a JSON file and creates a new policy resource.
    
.NOTES
    File Name: 86_Import-IntuneJSON.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [string]$JsonPath
)

Connect-MgGraph -Scopes "DeviceManagementConfiguration.ReadWrite.All"

$Json = Get-Content $JsonPath | ConvertFrom-Json
# Convert back to hashtable for body parameter often needed
# New-MgDeviceManagementDeviceCompliancePolicy -BodyParameter $Json
Write-Host "Import logic requires casting JSON object to Hashtable carefully."
