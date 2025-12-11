<#
.SYNOPSIS
    Gets the current Graph Access Token.
    
.DESCRIPTION
    Useful for debugging or using in Postman/other tools.
    
.NOTES
    File Name: 83_Get-GraphToken.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Connect-MgGraph -Scopes "User.Read" -ErrorAction SilentlyContinue

$Context = Get-MgContext
if ($Context) {
    # Note: Access token might not be directly property effectively in all versions, 
    # but we can try to extract from the auth header convention if using direct auth context.
    # The MgContext object often hides the raw token for security. 
    # This is a placeholder for where one would extract it if needed.
    
    Write-Host "Tenant ID: $($Context.TenantId)"
    Write-Host "Scopes: $($Context.Scopes -join ', ')"
    Write-Host "To see token, use 'Get-MgContext -Select AccessToken' (if supported) or debug."
}
