# redact_transcript.ps1
# De-identify chat transcripts: replace names, phone numbers, locations, and other PII with placeholders.
param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,

    [string]$OutputFile,

    [string[]]$NamesToRedact = @(),

    [switch]$RedactNumbers = $true,

    [switch]$RedactLocations = $true,

    [switch]$DryRun = $false
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $InputFile)) {
    Write-Error "Input file not found: $InputFile"
    exit 1
}

if (-not $OutputFile) {
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($InputFile)
    $OutputFile = Join-Path ([System.IO.Path]::GetDirectoryName($InputFile)) "${baseName}_redacted.txt"
}

Write-Host "=== Transcript Redaction ===" -ForegroundColor Cyan
Write-Host "Input:  $InputFile"
Write-Host "Output: $OutputFile"

$content = Get-Content $InputFile -Raw

# Phone number patterns (Chinese mobile, international)
$phonePatterns = @(
    '1[3-9]\d{9}',                    # Chinese mobile
    '\+\d{1,3}[\s-]?\d{6,14}',        # International
    '\d{3,4}[\s-]?\d{7,8}'            # Chinese landline
)

# Location patterns (address-like)
$locationKeywords = @('省', '市', '区', '县', '镇', '村', '路', '街', '号', '栋', '单元', '室')

# ID number patterns (Chinese ID: 18 digits)
$idPattern = '\d{6}(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])\d{3}[\dXx]'

$redactions = @()

# Redact provided names
foreach ($name in $NamesToRedact) {
    if ($content -match [regex]::Escape($name)) {
        $count = ([regex]::Matches($content, [regex]::Escape($name))).Count
        $placeholder = "[Person_$($redactions.Count + 1)]"
        $content = $content -replace [regex]::Escape($name), $placeholder
        $redactions += "Name '$name' → '$placeholder' ($count occurrences)"
    }
}

# Redact Chinese ID numbers
if ($RedactNumbers) {
    $idMatches = [regex]::Matches($content, $idPattern)
    if ($idMatches.Count -gt 0) {
        $content = $content -replace $idPattern, '[REDACTED_ID]'
        $redactions += "ID numbers: $($idMatches.Count) redacted"
    }

    foreach ($pattern in $phonePatterns) {
        $phoneMatches = [regex]::Matches($content, $pattern)
        if ($phoneMatches.Count -gt 0) {
            $content = $content -replace $pattern, '[REDACTED_PHONE]'
            $redactions += "Phone numbers (pattern '$pattern'): $($phoneMatches.Count) redacted"
        }
    }
}

# Redact locations
if ($RedactLocations) {
    # Redact lines containing 3+ location keywords
    $lines = $content -split "`n"
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $keywordCount = 0
        foreach ($kw in $locationKeywords) {
            $keywordCount += ([regex]::Matches($lines[$i], [regex]::Escape($kw))).Count
        }
        if ($keywordCount -ge 3) {
            $lines[$i] = '[REDACTED_LOCATION]'
            $redactions += "Line $($i+1): redacted as likely address"
        }
    }
    $content = $lines -join "`n"
}

if ($DryRun) {
    Write-Host "`n=== DRY RUN - Redactions that WOULD be made ===" -ForegroundColor Yellow
    $redactions | ForEach-Object { Write-Host "  $_" }
    Write-Host "Total redactions: $($redactions.Count)"
}
else {
    $content | Out-File $OutputFile -Encoding UTF8
    Write-Host "`nRedactions performed:" -ForegroundColor Cyan
    $redactions | ForEach-Object { Write-Host "  $_" }
    Write-Host "`nRedacted file saved to: $OutputFile"
}

exit 0
