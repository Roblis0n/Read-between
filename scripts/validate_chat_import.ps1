# validate_chat_import.ps1
# Validate chat import manifest: check required fields, message counts, speaker mapping, and format warnings.
param(
    [Parameter(Mandatory=$true)]
    [string]$ManifestFile
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $ManifestFile)) {
    Write-Error "Manifest file not found: $ManifestFile"
    exit 1
}

Write-Host "=== Chat Import Validation ===" -ForegroundColor Cyan

$manifest = Get-Content $ManifestFile -Raw | ConvertFrom-Json
$errors = @()
$warnings = @()

# Required manifest fields
$requiredFields = @("source", "time_range", "message_count")
foreach ($field in $requiredFields) {
    if (-not $manifest.$field) {
        $errors += "Missing required manifest field: $field"
    }
}

# Speaker mapping (mandatory)
if (-not $manifest.speaker_mapping) {
    $errors += "Missing required field: speaker_mapping. Must contain 'user' and 'other' keys identifying who is who in the chat."
}
else {
    if (-not $manifest.speaker_mapping.user) {
        $errors += "speaker_mapping missing 'user' key — which speaker is the user?"
    }
    if (-not $manifest.speaker_mapping.other) {
        $errors += "speaker_mapping missing 'other' key — which speaker is the other person?"
    }
    if ($manifest.speaker_mapping.user -and $manifest.speaker_mapping.other -and
        $manifest.speaker_mapping.user -eq $manifest.speaker_mapping.other) {
        $errors += "speaker_mapping: 'user' and 'other' cannot be the same value"
    }
}

# Source validation
$validSources = @("wechat_export", "qq_export", "manual_copy", "screenshot_ocr", "voice_transcript", "user_narration", "whatsapp_export", "telegram_export", "json_export", "csv_export")
if ($manifest.source -and $manifest.source -notin $validSources) {
    $warnings += "Unknown source type: $($manifest.source). Supported: $($validSources -join ', ')"
}

# Time range
if ($manifest.time_range) {
    if (-not $manifest.time_range.start) { $errors += "time_range missing 'start'" }
    if (-not $manifest.time_range.end) { $errors += "time_range missing 'end'" }
    if ($manifest.time_range.start -and $manifest.time_range.end) {
        if ([DateTime]$manifest.time_range.start -gt [DateTime]$manifest.time_range.end) {
            $errors += "time_range start is after end"
        }
    }
}

# Message count
if ($manifest.message_count -and [int]$manifest.message_count -le 0) {
    $errors += "message_count must be > 0"
}

# Deidentification status
$validDeidStatus = @("raw", "partial", "full")
if ($manifest.deidentification_status -and $manifest.deidentification_status -notin $validDeidStatus) {
    $warnings += "Unknown deidentification_status: $($manifest.deidentification_status)"
}

# Parse warnings
if ($manifest.parse_warnings) {
    Write-Host "  Parse warnings ($($manifest.parse_warnings.Count)):" -ForegroundColor Yellow
    $manifest.parse_warnings | ForEach-Object { Write-Host "    - $_" -ForegroundColor Yellow }
}

# Report
Write-Host "  Source:         $($manifest.source)"
Write-Host "  Time range:     $($manifest.time_range.start) → $($manifest.time_range.end)"
Write-Host "  Message count:  $($manifest.message_count)"
Write-Host "  Attachments:    $($manifest.attachment_count)"
Write-Host "  De-ID status:   $($manifest.deidentification_status)"

if ($errors.Count -gt 0) {
    Write-Host "`nERRORS ($($errors.Count)):" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    exit 1
}

Write-Host "`nValidation passed." -ForegroundColor Green
exit 0
