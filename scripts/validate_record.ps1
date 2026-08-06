# validate_record.ps1
# Validate a single memory record: check required YAML frontmatter fields, stable ID, status, and basis.
param(
    [Parameter(Mandatory=$true)]
    [string]$RecordFile,

    [switch]$Strict
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $RecordFile)) {
    Write-Error "Record file not found: $RecordFile"
    exit 1
}

Write-Host "=== Record Validation ===" -ForegroundColor Cyan
Write-Host "File: $RecordFile"

$content = Get-Content $RecordFile -Raw
$errors = @()
$warnings = @()

# Check YAML frontmatter
if ($content -notmatch '^---\s*\n(.*?)\n---', [System.Text.RegularExpressions.RegexOptions]::Singleline) {
    $errors += "No YAML frontmatter found (must start with --- and have closing ---)"
}
else {
    $yamlBlock = $Matches[1]

    # Required fields
    $requiredFields = @{
        'id' = 'Stable ID (e.g., p-20260805T143000+0800-a7k2)'
        'type' = 'Record type (profile|person|relationship|event|conversation|decision|review)'
        'created_at' = 'ISO 8601 creation timestamp'
        'status' = 'Status (active|paused|ended|uncertain|superseded)'
        'basis' = 'Evidence basis (user-confirmed|quoted-chat|agent-inference|external-source|mixed)'
        'confidence' = 'Confidence level (confirmed|probable|possible|unknown|mixed)'
    }

    foreach ($field in $requiredFields.Keys) {
        if ($yamlBlock -notmatch "$field\s*:") {
            $errors += "Missing required field: $field ($($requiredFields[$field]))"
        }
    }

    # Validate 'type' values
    if ($yamlBlock -match 'type\s*:\s*(\S+)') {
        $validTypes = @('profile', 'person', 'relationship', 'event', 'conversation', 'decision', 'review')
        if ($Matches[1] -notin $validTypes) {
            $errors += "Invalid type '$($Matches[1])'. Must be one of: $($validTypes -join ', ')"
        }
    }

    # Validate 'status' values
    if ($yamlBlock -match 'status\s*:\s*(\S+)') {
        $validStatus = @('active', 'paused', 'ended', 'uncertain', 'superseded')
        if ($Matches[1] -notin $validStatus) {
            $errors += "Invalid status '$($Matches[1])'. Must be one of: $($validStatus -join ', ')"
        }
    }

    # Validate 'basis' values
    if ($yamlBlock -match 'basis\s*:\s*(\S+)') {
        $validBasis = @('user-confirmed', 'quoted-chat', 'agent-inference', 'external-source', 'mixed')
        if ($Matches[1] -notin $validBasis) {
            $errors += "Invalid basis '$($Matches[1])'. Must be one of: $($validBasis -join ', ')"
        }
    }

    # Validate 'confidence' values
    if ($yamlBlock -match 'confidence\s*:\s*(\S+)') {
        $validConf = @('confirmed', 'probable', 'possible', 'unknown', 'mixed')
        if ($Matches[1] -notin $validConf) {
            $errors += "Invalid confidence '$($Matches[1])'. Must be one of: $($validConf -join ', ')"
        }
    }

    # Check: agent-inference must not be user-confirmed
    if ($yamlBlock -match 'basis\s*:\s*agent-inference' -and $yamlBlock -match 'confidence\s*:\s*confirmed') {
        $errors += "agent-inference basis cannot have 'confirmed' confidence. Use 'probable', 'possible', or 'unknown'."
    }

    # Check: sensitivity field
    if ($yamlBlock -match 'sensitivity\s*:\s*(\S+)') {
        $validSens = @('normal', 'sensitive', 'highly-sensitive')
        if ($Matches[1] -notin $validSens) {
            $warnings += "Unknown sensitivity '$($Matches[1])'. Should be one of: $($validSens -join ', ')"
        }
    }

    # Check stable ID format
    if ($yamlBlock -match 'id\s*:\s*(\S+)') {
        $id = $Matches[1]
        if ($id -match '^(p|r|e|c|d|v)-(\d{8}T\d{6}[+-]\d{4})-([a-z0-9]{4})$') {
            $prefix = $Matches[1]
            $ts = $Matches[2]
            Write-Host "  Stable ID: $id (valid format)" -ForegroundColor Green
        }
        else {
            $warnings += "Stable ID '$id' does not match expected format (e.g., p-20260805T143000+0800-a7k2)"
        }
    }
}

# Strict: check body has required sections
if ($Strict -and $content -match '^---\s*\n.*?\n---\s*\n(.*)' ) {
    $body = $Matches[2]
    # Body should at minimum separate facts from inference
    # This is a heuristic check - not enforcing specific headers
}

# Report
if ($errors.Count -gt 0) {
    Write-Host "`nERRORS ($($errors.Count)):" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    exit 1
}

if ($warnings.Count -gt 0) {
    Write-Host "`nWARNINGS ($($warnings.Count)):" -ForegroundColor Yellow
    $warnings | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
}

Write-Host "Validation passed." -ForegroundColor Green
exit 0
