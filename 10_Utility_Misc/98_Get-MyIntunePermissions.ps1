<#
.SYNOPSIS
    Checks current Graph Token Scopes.
    
.DESCRIPTION
    Explains what the current session can do.
    
.NOTES
    File Name: 98_Get-MyIntunePermissions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

$Ctx = Get-MgContext
Write-Host "Account: $($Ctx.Account)"
Write-Host "Scopes Granted:"
$Ctx.Scopes | ForEach-Object { Write-Host " - $_" }
