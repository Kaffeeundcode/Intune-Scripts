<#
.SYNOPSIS
    Reports on the distribution of MFA methods registered by users.

.DESCRIPTION
    Analyzes which authentication methods users have registered (Microsoft Authenticator, SMS, Phone, FIDO2).
    Helpful for driving migration from SMS to Authenticator App.

.NOTES
    File Name  : 114_Get-EntraIDMFAAuthenticationMethodUsage.ps1
    Author     : Kaffeeundcode
    Version    : 1.0
#>

try {
    Connect-MgGraph -Scopes "UserAuthenticationMethod.Read.All", "User.Read.All" -ErrorAction Stop
} catch {
    Write-Error "Login failed"
    exit
}

Write-Host "This report requires scanning every user. This may take a while." -ForegroundColor Yellow
$Users = Get-MgUser -All -Filter "userType eq 'Member'"
$TotalUsers = $Users.Count

$MethodCounts = @{
    "microsoftAuthenticator" = 0
    "phoneNumber" = 0 # SMS/Voice
    "fido2" = 0
    "windowsHelloForBusiness" = 0
    "email" = 0
    "softwareOath" = 0
    "None" = 0
}

$Progress = 0
foreach ($User in $Users) {
    $Progress++
    Write-Progress -Activity "Scanning MFA Methods" -Status "$($User.UserPrincipalName)" -PercentComplete (($Progress / $TotalUsers) * 100)

    try {
        $Methods = Get-MgUserAuthenticationMethod -UserId $User.Id -ErrorAction SilentlyContinue
        if ($Methods) {
            foreach ($M in $Methods) {
                if ($MethodCounts.ContainsKey($M.AdditionalProperties["@odata.type"].Split(".")[-1])) {
                     # Simplified type matching
                     # e.g. #microsoft.graph.microsoftAuthenticatorAuthenticationMethod
                     $Type = $M.AdditionalProperties["@odata.type"].Split(".")[-1]
                     $MethodCounts[$Type]++
                } else {
                    $Type = $M.AdditionalProperties["@odata.type"].Split(".")[-1]
                    # Add dynamic key if new
                    if (-not $MethodCounts.ContainsKey($Type)) { $MethodCounts[$Type] = 1 } else { $MethodCounts[$Type]++ }
                }
            }
        } else {
            $MethodCounts["None"]++
        }
    } catch {
        $MethodCounts["None"]++
    }
}

Write-Host "MFA Method Distribution:" -ForegroundColor Cyan
$MethodCounts.GetEnumerator() | Sort-Object Value -Descending | Format-Table Name, Value -AutoSize

# Generate simple CSV
$MethodCounts.GetEnumerator() | Select-Object Key, Value | Export-Csv "$PSScriptRoot\MFA_Stats.csv" -NoTypeInformation
