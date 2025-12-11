<#
.SYNOPSIS
    Restores a Deleted Directory Object.
    
.DESCRIPTION
    Requires 'Directory.ReadWrite.All' permission.
    
.NOTES
    File Name: 89_Restore-DeletedItem.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param([string]$Id)

Connect-MgGraph -Scopes "Directory.ReadWrite.All"
Restore-MgDirectoryDeletedItem -DirectoryObjectId $Id
