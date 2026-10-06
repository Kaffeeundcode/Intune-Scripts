[CmdletBinding()]
param([Parameter(Mandatory)][string]$AnalyzerModulePath,[string]$RepositoryRoot=(Resolve-Path "$PSScriptRoot/../../..").Path,[Parameter(Mandatory)][string]$OutputPath)
$ErrorActionPreference='Stop'
Import-Module $AnalyzerModulePath -Force
$manifest=Get-Content (Join-Path $RepositoryRoot 'library.manifest.json') -Raw | ConvertFrom-Json
$paths=@($manifest.scripts.path)+@('Common/IntuneLibrary.psm1','Common/IntuneReportLibrary.psm1','16_Teams_Telephony/000_TeamsTelephonyHelper.ps1')
$findings=@(foreach($relative in $paths){
    foreach($issue in Invoke-ScriptAnalyzer -Path (Join-Path $RepositoryRoot $relative) -Severity Error,Warning){
        [pscustomobject]@{Path=$relative;Line=$issue.Line;Rule=$issue.RuleName;Severity=[string]$issue.Severity;Message=$issue.Message}
    }
})
$report=[pscustomobject]@{TestedAt=[datetime]::UtcNow.ToString('o');PowerShell=$PSVersionTable.PSVersion.ToString();Analyzer=(Get-Module PSScriptAnalyzer).Version.ToString();Files=$paths.Count;Errors=@($findings|Where-Object Severity -eq Error).Count;Warnings=@($findings|Where-Object Severity -eq Warning).Count;TopRules=@($findings|Group-Object Rule|Sort-Object Count -Descending|Select-Object Name,Count);Scope='Static analysis; warnings retained; no tenant proof';Findings=$findings}
$report|ConvertTo-Json -Depth 10|Set-Content -LiteralPath $OutputPath -Encoding UTF8
$report|Select-Object Files,Errors,Warnings
if($report.Errors){exit 1}
