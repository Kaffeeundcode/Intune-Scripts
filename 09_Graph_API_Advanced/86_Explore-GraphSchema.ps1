<#
.SYNOPSIS
    Erforscht das Graph-Schema (Metadata).
    
.DESCRIPTION
    Lädt das $metadata Dokument (CSDL) herunter, um verfügbare Properties zu sehen.
    
.NOTES
    File Name: 86_Explore-GraphSchema.ps1
    Author: Mattia Cirillo
    Version: 1.0
#>

param()

Invoke-WebRequest -Uri "https://graph.microsoft.com/v1.0/`$metadata" -OutFile "$HOME/Desktop/GraphMetadata.xml"
Write-Host "Metadata XML gespeichert."
