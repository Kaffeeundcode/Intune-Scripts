[CmdletBinding()]
param([string]$RepositoryRoot=(Resolve-Path "$PSScriptRoot/../../..").Path,[string]$OutputPath,[string]$PesterModulePath)
$ErrorActionPreference='Stop'
if ($PesterModulePath) {Import-Module $PesterModulePath -Force} else {Import-Module Pester -MinimumVersion 5.7 -ErrorAction Stop}
$manifest=Get-Content (Join-Path $RepositoryRoot 'library.manifest.json') -Raw | ConvertFrom-Json
$syntaxErrors=@(foreach($entry in $manifest.scripts){
    $tokens=$null;$parseErrors=$null
    [void][Management.Automation.Language.Parser]::ParseFile((Join-Path $RepositoryRoot $entry.path),[ref]$tokens,[ref]$parseErrors)
    foreach($errorItem in $parseErrors){[pscustomobject]@{Path=$entry.path;Line=$errorItem.Extent.StartLineNumber;Message=$errorItem.Message}}
})
$config=New-PesterConfiguration
$config.Run.Path=Join-Path $RepositoryRoot 'tests/powershell/unit'
$config.Run.PassThru=$true
$config.Output.Verbosity='Detailed'
$result=Invoke-Pester -Configuration $config
$summary=[pscustomobject]@{TestedAt=[datetime]::UtcNow.ToString('o');PowerShell=$PSVersionTable.PSVersion.ToString();Platform=[Environment]::OSVersion.VersionString;SyntaxFiles=$manifest.scripts.Count;SyntaxErrors=$syntaxErrors;Passed=$result.PassedCount;Failed=$result.FailedCount;Skipped=$result.SkippedCount;Result=$result.Result;Scope='Offline unit tests with mocked Graph/Teams. No tenant or app-installation proof.'}
if($OutputPath){$summary|ConvertTo-Json -Depth 20|Set-Content -LiteralPath $OutputPath -Encoding UTF8}
$summary
if($syntaxErrors.Count -or $result.FailedCount -or $result.Result -ne 'Passed'){exit 1}
