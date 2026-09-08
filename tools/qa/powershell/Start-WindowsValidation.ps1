$ErrorActionPreference='Stop'
$destination=Join-Path $env:TEMP 'KaffeeundCode-Library-20260908'
New-Item -ItemType Directory -Path $destination -Force | Out-Null
Expand-Archive -LiteralPath (Join-Path $env:USERPROFILE 'kc-validation-20260908.zip') -DestinationPath $destination -Force
Expand-Archive -LiteralPath (Join-Path $destination 'kc-pester.zip') -DestinationPath (Join-Path $destination 'Pester') -Force
$output=Join-Path $destination 'windows-unit-tests.json'
& (Join-Path $destination 'tools/qa/powershell/Invoke-LibraryValidation.ps1') -RepositoryRoot $destination -PesterModulePath (Join-Path $destination 'Pester/Pester.psd1') -OutputPath $output
Write-Output "VALIDATION_REPORT=$output"
