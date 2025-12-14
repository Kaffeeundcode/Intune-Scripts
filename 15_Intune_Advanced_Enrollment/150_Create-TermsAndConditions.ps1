<#
.SYNOPSIS
    Erstellt neue Nutzungsbedingungen.
    
.DESCRIPTION
    Legt eine Terms & Conditions Policy an, die Nutzer akzeptieren müssen.
    Erfordert die Berechtigung 'DeviceManagementConfiguration.ReadWrite.All'.

.NOTES
    File Name: 150_Create-TermsAndConditions.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param (
    [string]$Title = "Company T&C"
)

$Params = @{
    displayName = $Title
    acceptanceStatement = "I agree."
    bodyText = "Please behave."
}
New-MgDeviceManagementTermAndCondition -BodyParameter $Params
Write-Host "Terms erstellt."
