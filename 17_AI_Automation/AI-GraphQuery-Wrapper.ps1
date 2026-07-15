<#
.SYNOPSIS
    AI-GraphQuery-Wrapper - Translates natural language to Microsoft Graph OData filters.
    
.DESCRIPTION
    This script leverages an LLM to convert human-readable requests into precise 
    OData filter strings for Microsoft Graph API calls.
    
    Example Request: "All HP laptops that haven't synced in 30 days"
    Resulting Filter: "manufacturer eq 'HP' and lastSyncDateTime lt 2026-06-15T00:00:00Z"
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string]$Query,

    [Parameter(Mandatory=$false)]
    [string]$ApiKey = "YOUR_API_KEY", 

    [Parameter(Mandatory=$false)]
    [string]$TargetEndpoint = "devices"
)

process {
    Write-Host "[INFO] Analyzing request: '$Query'..." -ForegroundColor Cyan

    $SystemPrompt = "You are a Microsoft Graph API expert. Translate the user's natural language request into a valid OData `$filter` string for the endpoint '$TargetEndpoint'. Return ONLY the filter string. No explanation, no markdown, no quotes. Example: 'manufacturer eq 'Dell' and complianceState eq 'noncompliant'"
    
    $Body = @{
        model = "gpt-4o"
        messages = @(
            @{ role = "system"; content = $SystemPrompt },
            @{ role = "user"; content = $Query }
        )
        temperature = 0
    } | ConvertTo-Json

    try {
        $Response = Invoke-RestMethod -Method Post -Uri "https://api.openai.com/v1/chat/completions" `
            -Headers @{ "Authorization" = "Bearer $ApiKey"; "Content-Type" = "application/json" } `
            -Body $Body

        $ODataFilter = $Response.choices[0].message.content.Trim()
        Write-Host "[SUCCESS] Generated Filter: $ODataFilter" -ForegroundColor Green

        Write-Host "[EXEC] Fetching data from Graph..." -ForegroundColor Gray
        $Results = Get-MgDevice -Filter $ODataFilter -All

        return $Results
    }
    catch {
        Write-Error "Failed to translate or execute query: $($_.Exception.Message)"
    }
}