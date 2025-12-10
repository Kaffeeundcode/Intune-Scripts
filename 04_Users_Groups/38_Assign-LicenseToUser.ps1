<#
.SYNOPSIS
    Assigns a License to a User.
    
.DESCRIPTION
    Assigns an Office 365 or Intune license by SKU ID.
    Requires 'User.ReadWrite.All' permission.

.NOTES
    File Name: 38_Assign-LicenseToUser.ps1
    Author: Kaffee & Code Assistant
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory=$true)]
    [string]$SkuId
)

Connect-MgGraph -Scopes "User.ReadWrite.All"

$User = Get-MgUser -UserId $UserPrincipalName

# Prepare assignment
$Params = @{
    addLicenses = @(
        @{
            skuId = $SkuId
        }
    )
    removeLicenses = @()
}

try {
    Set-MgUserLicense -UserId $User.Id -BodyParameter $Params
    Write-Host "License assigned to $UserPrincipalName." -ForegroundColor Green
} catch {
    Write-Error "Failed: $_"
}
