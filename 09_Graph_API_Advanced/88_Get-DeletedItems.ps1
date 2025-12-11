<#
.SYNOPSIS
    Checks Deleted Items (Recycle Bin) for Directory Objects.
    
.DESCRIPTION
    Requires 'Directory.Read.All' permission.
    
.NOTES
    File Name: 88_Get-DeletedItems.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

Connect-MgGraph -Scopes "Directory.Read.All"
Get-MgDirectoryDeletedItem -All
