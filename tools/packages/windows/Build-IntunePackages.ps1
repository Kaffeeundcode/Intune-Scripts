[CmdletBinding()]
param([string]$InputDirectory=$env:USERPROFILE,[string]$ToolPath=(Join-Path $env:USERPROFILE 'IntuneWinAppUtil.exe'))
$ErrorActionPreference='Stop'
$base=Join-Path $env:TEMP 'KaffeeundCode-Packages-20260908'
New-Item -ItemType Directory -Path $base -Force | Out-Null
$packages=@('7zip-26.03','notepadplusplus-8.9.8','vlc-3.0.23','git-2.55.0.5','powertoys-0.101.2362.0')
$results=@(foreach($name in $packages){
    $archive=Join-Path $InputDirectory "$name-x64-r1-PSADT.zip"
    $content=Join-Path $base "$name/content"
    $output=Join-Path $base "$name/output"
    Expand-Archive -LiteralPath $archive -DestinationPath $content -Force
    New-Item -ItemType Directory -Path $output -Force | Out-Null
    $parseErrors=@(foreach($file in Get-ChildItem $content -Filter '*.ps1' -Recurse){
        $tokens=$null;$errors=$null
        [void][Management.Automation.Language.Parser]::ParseFile($file.FullName,[ref]$tokens,[ref]$errors)
        foreach($item in $errors){"$($file.Name): $($item.Message)"}
    })
    if($parseErrors.Count){throw ($parseErrors -join '; ')}
    & $ToolPath -c $content -s 'Deploy-Application.exe' -o $output -q
    if($LASTEXITCODE -ne 0){throw "Content Prep Tool failed: $name ($LASTEXITCODE)"}
    $file=Join-Path $output 'Deploy-Application.intunewin'
    if(-not(Test-Path $file)){throw "Missing output: $name"}
    $destination=Join-Path $InputDirectory "$name-x64-r1.intunewin"
    Copy-Item $file $destination -Force
    [pscustomobject]@{Package=$name;TestedAt=[datetime]::UtcNow.ToString('o');Windows=[Environment]::OSVersion.VersionString;PowerShell=$PSVersionTable.PSVersion.ToString();SourceZipSHA256=(Get-FileHash $archive -Algorithm SHA256).Hash.ToLower();IntuneWinSHA256=(Get-FileHash $destination -Algorithm SHA256).Hash.ToLower();Bytes=(Get-Item $destination).Length;ToolSHA256=(Get-FileHash $ToolPath -Algorithm SHA256).Hash.ToLower();ToolVersion=(Get-Item $ToolPath).VersionInfo.FileVersion;PowerShellSyntax='passed';Packaging='passed';Installation='not_tested';IntuneDeployment='not_tested'}
})
$results | ConvertTo-Json -Depth 8 | Set-Content (Join-Path $InputDirectory 'kc-package-build-results.json') -Encoding UTF8
$results | Format-Table Package,Packaging,PowerShellSyntax,Bytes
