<#
.SYNOPSIS
    Creates a new Azure AD Security Group.
    
.DESCRIPTION
    Requires 'Group.ReadWrite.All' permission.

.NOTES
    File Name: 37_Create-IntuneGroup.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$GroupName,
    
    [string]$Description = "Created via PowerShell"
)

Connect-MgGraph -Scopes "Group.ReadWrite.All"

$Params = @{
    displayName = $GroupName
    mailEnabled = $false
    mailNickname = ($GroupName -replace " ", "")
    securityEnabled = $true
    description = $Description
}

try {
    $Group = New-MgGroup -BodyParameter $Params
    Write-Host "Group Created: $($Group.DisplayName) ($($Group.Id))" -ForegroundColor Green
} catch {
    Write-Error "Failed to create group: $_"
}
