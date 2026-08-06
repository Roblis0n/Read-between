# validate_memory_store.ps1
# Validate the memory store directory: check structure, data-root integrity, and record consistency.
param(
    [string]$DataRoot,

    [switch]$CheckRecords
)

$ErrorActionPreference = "Stop"

Write-Host "=== Memory Store Validation ===" -ForegroundColor Cyan

# Resolve data root
if (-not $DataRoot) {
    $refsDir = Join-Path $PSScriptRoot "..\references"
    $dataRootFile = Join-Path $refsDir "data-root.txt"
    if (Test-Path $dataRootFile) {
        $DataRoot = (Get-Content $dataRootFile -Raw).Trim()
    }
    else {
        Write-Error "data-root.txt not found and no -DataRoot specified"
        exit 1
    }
}

Write-Host "Data root: $DataRoot"

if (-not (Test-Path $DataRoot)) {
    Write-Warning "Data root directory does not exist: $DataRoot"
    Write-Host "  This is normal if no long-term records have been created yet."
    Write-Host "  The directory will be created on first memory write."
    exit 0
}

# Check directory structure
$expectedDirs = @("people", "relationships", "exports")
foreach ($dir in $expectedDirs) {
    $dirPath = Join-Path $DataRoot $dir
    if (-not (Test-Path $dirPath)) {
        Write-Warning "Expected directory not found: $dir (will be created on demand)"
    }
    else {
        Write-Host "  [OK] $dir/" -ForegroundColor Green
    }
}

# Path traversal check: data root must be an absolute path within expected boundaries
$normalizedRoot = [System.IO.Path]::GetFullPath($DataRoot)
if ($normalizedRoot -ne $DataRoot -and $normalizedRoot -ne "$DataRoot\") {
    Write-Warning "Data root normalized from '$DataRoot' to '$normalizedRoot'"
}

# Check for path traversal attempts (.. in path)
if ($DataRoot -match '\.\.') {
    Write-Error "Data root contains '..' - possible path traversal"
    exit 1
}

# Check profile.md if it exists
$profilePath = Join-Path $DataRoot "profile.md"
if (Test-Path $profilePath) {
    $profileContent = Get-Content $profilePath -Raw
    # Profile should not contain personality disorder diagnoses
    $dangerousTerms = @('NPD', 'BPD', '自恋型人格', '边缘型人格', '反社会人格')
    foreach ($term in $dangerousTerms) {
        if ($profileContent -match [regex]::Escape($term)) {
            Write-Warning "profile.md contains potential diagnosis term: '$term'. These should not be used as confirmed facts."
        }
    }
    Write-Host "  [OK] profile.md found" -ForegroundColor Green
}

# Check record files if requested
if ($CheckRecords) {
    $recordFiles = Get-ChildItem -Path $DataRoot -Recurse -Filter "*.md" | Where-Object {
        $_.Name -match '^(p|r|e|c|d|v)-'
    }
    Write-Host "`n  Checking $($recordFiles.Count) record files..."
    $failCount = 0
    foreach ($file in $recordFiles) {
        $result = & "$PSScriptRoot\validate_record.ps1" -RecordFile $file.FullName 2>&1
        if ($LASTEXITCODE -ne 0) {
            $failCount++
        }
    }
    if ($failCount -gt 0) {
        Write-Host "  $failCount record(s) failed validation" -ForegroundColor Red
    }
    else {
        Write-Host "  All records passed validation" -ForegroundColor Green
    }
}

Write-Host "`nMemory store validation complete." -ForegroundColor Green
exit 0
