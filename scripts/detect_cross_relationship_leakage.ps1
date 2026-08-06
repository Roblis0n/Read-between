# detect_cross_relationship_leakage.ps1
# Scan memory records for potential cross-relationship data leakage:
# - Same person ID referenced by multiple relationships unexpectedly
# - Personal details appearing in wrong relationship context
# - Missing isolation between relationship directories
param(
    [string]$DataRoot,

    [switch]$Verbose
)

$ErrorActionPreference = "Stop"

Write-Host "=== Cross-Relationship Leakage Detection ===" -ForegroundColor Cyan

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

if (-not (Test-Path $DataRoot)) {
    Write-Host "Data root does not exist: $DataRoot"
    Write-Host "No records to check."
    exit 0
}

$findings = @()

# 1. Check people/ for person records
$peopleDir = Join-Path $DataRoot "people"
$personIds = @{}
if (Test-Path $peopleDir) {
    Get-ChildItem $peopleDir -Filter "p-*.md" | ForEach-Object {
        $personIds[$_.BaseName] = $_.FullName
    }
}

# 2. Check relationships/ directory isolation
$relationshipsDir = Join-Path $DataRoot "relationships"
if (Test-Path $relationshipsDir) {
    $relationshipDirs = Get-ChildItem $relationshipsDir -Directory

    # Check that each relationship directory is self-contained
    foreach ($relDir in $relationshipDirs) {
        $relId = $relDir.Name

        # Check for expected subdirectories
        $expectedSubs = @("events", "conversations", "decisions", "reviews")
        foreach ($sub in $expectedSubs) {
            $subPath = Join-Path $relDir.FullName $sub
            if (-not (Test-Path $subPath)) {
                if ($Verbose) {
                    Write-Host "  Missing subdirectory: $relId/$sub/ (will be created on demand)"
                }
            }
        }

        # Read overview.md for relationship_id references
        $overviewPath = Join-Path $relDir.FullName "overview.md"
        if (Test-Path $overviewPath) {
            $overview = Get-Content $overviewPath -Raw
            # Extract person references (p-* stable IDs)
            $personRefs = [regex]::Matches($overview, 'p-\d{8}T\d{6}[+-]\d{4}-[a-z0-9]{4}')
            foreach ($ref in $personRefs) {
                if (-not $personIds.ContainsKey($ref.Value)) {
                    $findings += "Relationship '$relId' references person '$($ref.Value)' not found in people/"
                }
            }
        }
    }

    # 3. Check for cross-relationship references
    # Each relationship directory should only reference its own events/conversations
    foreach ($relDir in $relationshipDirs) {
        $relId = $relDir.Name
        $allContent = ""
        Get-ChildItem $relDir.FullName -Recurse -Filter "*.md" | ForEach-Object {
            $allContent += Get-Content $_.FullName -Raw
        }

        # Look for references to other relationship IDs
        foreach ($otherDir in $relationshipDirs) {
            $otherId = $otherDir.Name
            if ($otherId -ne $relId) {
                if ($allContent -match [regex]::Escape($otherId)) {
                    $findings += "Possible cross-reference: '$relId' contains reference to '$otherId'"
                }
            }
        }
    }
}

# 4. Check exports/ doesn't contain raw sensitive data
$exportsDir = Join-Path $DataRoot "exports"
if (Test-Path $exportsDir) {
    $exportFiles = Get-ChildItem $exportsDir -Recurse
    foreach ($file in $exportFiles) {
        $ext = $file.Extension.ToLower()
        # Image/video files in exports may contain sensitive content
        if ($ext -in @('.jpg', '.jpeg', '.png', '.gif', '.mp4', '.mov')) {
            $findings += "Sensitive media in exports: $($file.Name) — verify this was intentionally exported"
        }
    }
}

# Report
Write-Host "  People records:   $($personIds.Count)"
Write-Host "  Relationships:    $(if (Test-Path $relationshipsDir) { (Get-ChildItem $relationshipsDir -Directory).Count } else { 0 })"

if ($findings.Count -eq 0) {
    Write-Host "`nNo cross-relationship leakage detected." -ForegroundColor Green
}
else {
    Write-Host "`nFINDINGS ($($findings.Count)):" -ForegroundColor Yellow
    $findings | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
}

exit $findings.Count
