# validate_contract.ps1
# Static verification: check all referenced files exist, SKILL.md frontmatter is valid,
# cross-references are complete, and no orphan files exist.
param(
    [string]$SkillRoot = $PSScriptRoot
)

$skillRoot = Resolve-Path "$SkillRoot\.."
$errors = @()
$warnings = @()

Write-Host "=== read-between Contract Validation ===" -ForegroundColor Cyan

# 1. Check SKILL.md exists and has valid frontmatter
$skillMdPath = Join-Path $skillRoot "SKILL.md"
if (-not (Test-Path $skillMdPath)) {
    $errors += "SKILL.md not found at $skillMdPath"
}
else {
    $skillContent = Get-Content $skillMdPath -Raw
    if ($skillContent -notmatch '^---\s*\n') {
        $errors += "SKILL.md missing YAML frontmatter (must start with ---)"
    }
    # Check name/description in the YAML frontmatter block (first ---...---), not elsewhere
    if ($skillContent -match '(?s)^---\s*\n(.*?)\n---') {
        $frontmatter = $Matches[1]
        if ($frontmatter -notmatch 'name:\s*read-between') {
            $errors += "SKILL.md frontmatter YAML block missing 'name: read-between'"
        }
        if ($frontmatter -notmatch 'description:\s*[>|]') {
            $warnings += "SKILL.md description should use YAML folded scalar (> ) or literal (| ) for multi-line triggers"
        }
    }
    else {
        $errors += "SKILL.md frontmatter YAML block not properly closed (missing second ---)"
    }
    Write-Host "  [OK] SKILL.md found with frontmatter" -ForegroundColor Green
}

# 2. Check agents/openai.yaml
$agentYamlPath = Join-Path $skillRoot "agents\openai.yaml"
if (-not (Test-Path $agentYamlPath)) {
    $errors += "agents/openai.yaml not found"
}
else {
    $agentContent = Get-Content $agentYamlPath -Raw
    if ($agentContent -notmatch 'display_name') { $errors += "openai.yaml missing display_name" }
    if ($agentContent -notmatch 'short_description') { $errors += "openai.yaml missing short_description" }
    if ($agentContent -notmatch 'default_prompt') { $errors += "openai.yaml missing default_prompt" }
    Write-Host "  [OK] agents/openai.yaml found" -ForegroundColor Green
}

# 3. Check all expected reference files
$expectedRefs = @(
    "lifecycle-routing.md",
    "intent-insight.md",
    "pursue-or-not.md",
    "pursuit-strategy.md",
    "early-dating.md",
    "emotional-containment.md",
    "chat-ingestion-contract.md",
    "chat-evidence-and-uncertainty.md",
    "reply-drafting.md",
    "dialogue-practice.md",
    "relationship-education.md",
    "conflict-and-repair.md",
    "partnership-marriage-overview.md",
    "safety-abuse-and-crisis.md",
    "privacy-threat-model.md",
    "memory-protocol.md",
    "source-registry.md",
    "past-wis-bridge.md",
    "output-contracts.md",
    "personality-insight-layer.md",
    "data-root.txt"
)

$refsDir = Join-Path $skillRoot "references"
foreach ($ref in $expectedRefs) {
    $refPath = Join-Path $refsDir $ref
    if (-not (Test-Path $refPath)) {
        $errors += "Missing reference file: references/$ref"
    }
}
Write-Host "  [OK] Checked $($expectedRefs.Count) expected reference files" -ForegroundColor Green

# 4. Check SKILL.md references match actual files + detect orphans
if (Test-Path $skillMdPath) {
    $refMatches = [regex]::Matches($skillContent, 'references/([a-z0-9-]+\.md)')
    $referencedFiles = $refMatches | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
    foreach ($ref in $referencedFiles) {
        $refPath = Join-Path $refsDir $ref
        if (-not (Test-Path $refPath)) {
            $warnings += "SKILL.md references '$ref' but file not found in references/"
        }
    }
    Write-Host "  [OK] Verified $($referencedFiles.Count) cross-references in SKILL.md" -ForegroundColor Green

    # Detect orphan .md files in references/ not referenced by SKILL.md
    $allRefFiles = Get-ChildItem $refsDir -Filter "*.md" | ForEach-Object { $_.Name }
    foreach ($file in $allRefFiles) {
        if ($file -notin $referencedFiles) {
            $warnings += "Orphan reference file: references/$file is not referenced in SKILL.md"
        }
    }
}

# 5. Check scripts directory
$scriptsDir = Join-Path $skillRoot "scripts"
$expectedScripts = @(
    "validate_contract.ps1",
    "validate_chat_import.ps1",
    "normalize_timestamps.ps1",
    "redact_transcript.ps1",
    "validate_record.ps1",
    "validate_memory_store.ps1",
    "detect_cross_relationship_leakage.ps1"
)
foreach ($script in $expectedScripts) {
    $scriptPath = Join-Path $scriptsDir $script
    if (-not (Test-Path $scriptPath)) {
        $warnings += "Script not yet created: scripts/$script"
    }
}
Write-Host "  [OK] Checked $($expectedScripts.Count) expected scripts" -ForegroundColor Green

# 6. Check data-root.txt
$dataRootPath = Join-Path $refsDir "data-root.txt"
if (Test-Path $dataRootPath) {
    $dataRoot = (Get-Content $dataRootPath -Raw).Trim()
    if ([string]::IsNullOrEmpty($dataRoot)) {
        $errors += "data-root.txt is empty"
    }
    else {
        Write-Host "  [OK] data-root.txt points to: $dataRoot" -ForegroundColor Green
    }
}

# Report
Write-Host ""
Write-Host "=== Validation Report ===" -ForegroundColor Cyan
if ($errors.Count -eq 0 -and $warnings.Count -eq 0) {
    Write-Host "All checks passed." -ForegroundColor Green
}
else {
    if ($errors.Count -gt 0) {
        Write-Host "ERRORS ($($errors.Count)):" -ForegroundColor Red
        $errors | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    }
    if ($warnings.Count -gt 0) {
        Write-Host "WARNINGS ($($warnings.Count)):" -ForegroundColor Yellow
        $warnings | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
    }
}

exit $errors.Count
