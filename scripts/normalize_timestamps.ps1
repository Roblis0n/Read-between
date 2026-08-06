# normalize_timestamps.ps1
# Normalize chat timestamps to ISO 8601 with Asia/Shanghai timezone.
# Handles sec/ms unit detection, missing timezone, and future/past anomalies.
param(
    [Parameter(Mandatory=$true)]
    [string]$InputFile,

    [string]$OutputFile,

    [string]$DefaultTimezone = "Asia/Shanghai",

    [int]$AnomalyThresholdYears = 1
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $InputFile)) {
    Write-Error "Input file not found: $InputFile"
    exit 1
}

if (-not $OutputFile) {
    $OutputFile = [System.IO.Path]::ChangeExtension($InputFile, ".normalized.json")
}

Write-Host "=== Timestamp Normalization ===" -ForegroundColor Cyan
Write-Host "Input:  $InputFile"
Write-Host "Output: $OutputFile"

# Load JSON or CSV
$ext = [System.IO.Path]::GetExtension($InputFile).ToLower()
if ($ext -eq '.json') {
    $data = Get-Content $InputFile -Raw | ConvertFrom-Json
}
elseif ($ext -eq '.csv') {
    $data = Import-Csv $InputFile
}
else {
    Write-Error "Unsupported format: $ext (use .json or .csv)"
    exit 1
}

$messages = @($data)
$normalized = @()
$warnings = @()
$now = Get-Date

foreach ($msg in $messages) {
    $rawTimestamp = $msg.timestamp
    if (-not $rawTimestamp) {
        $warnings += "Message missing timestamp, skipping: $($msg | ConvertTo-Json -Compress)"
        continue
    }

    $entry = [PSCustomObject]@{
        original_timestamp = "$rawTimestamp"
        normalized_timestamp = $null
        timezone = $DefaultTimezone
        precision = "unknown"
        anomaly = $false
        anomaly_reason = ""
    }

    # Try to interpret the timestamp
    $tsNum = 0
    $isNumeric = [long]::TryParse($rawTimestamp, [ref]$tsNum)

    if ($isNumeric) {
        # Detect sec vs ms: if > 1000000000000, likely milliseconds
        if ($tsNum -gt 1000000000000) {
            # Milliseconds since epoch
            $dt = [DateTimeOffset]::FromUnixTimeMilliseconds($tsNum)
            $entry.precision = "millisecond"
        }
        elseif ($tsNum -gt 1000000000) {
            # Seconds since epoch
            $dt = [DateTimeOffset]::FromUnixTimeSeconds($tsNum)
            $entry.precision = "second"
        }
        else {
            $warnings += "Timestamp value too small to be epoch: $rawTimestamp"
            $entry.anomaly = $true
            $entry.anomaly_reason = "Value too small for epoch time"
            $normalized += $entry
            continue
        }

        # Check for anomalies
        if ($dt.Year -lt 2000 -or $dt.Year -gt ($now.Year + $AnomalyThresholdYears)) {
            $entry.anomaly = $true
            $entry.anomaly_reason = "Year out of range: $($dt.Year)"
        }

        $entry.normalized_timestamp = $dt.ToString("yyyy-MM-ddTHH:mm:sszzz")
    }
    else {
        # Try parsing as string datetime
        $parsed = $null
        if ([DateTimeOffset]::TryParse($rawTimestamp, [ref]$parsed)) {
            $entry.normalized_timestamp = $parsed.ToString("yyyy-MM-ddTHH:mm:sszzz")
            $entry.precision = "parsed"
        }
        elseif ([DateTime]::TryParse($rawTimestamp, [ref]$null)) {
            # No timezone info, assume default
            $dt = [DateTime]::Parse($rawTimestamp)
            $entry.normalized_timestamp = $dt.ToString("yyyy-MM-ddTHH:mm:ss") + "+08:00"
            $entry.precision = "date-only-assumed-tz"
            $warnings += "No timezone in '$rawTimestamp', assuming $DefaultTimezone"
        }
        else {
            $warnings += "Cannot parse timestamp: $rawTimestamp"
            $entry.anomaly = $true
            $entry.anomaly_reason = "Unparseable timestamp format"
            $normalized += $entry
            continue
        }
    }

    $normalized += $entry
}

# Output
$result = [PSCustomObject]@{
    normalized_at = (Get-Date).ToString("yyyy-MM-ddTHH:mm:sszzz")
    total_messages = $messages.Count
    normalized_count = ($normalized | Where-Object { $_.normalized_timestamp -ne $null }).Count
    anomaly_count = ($normalized | Where-Object { $_.anomaly }).Count
    warnings = $warnings
    messages = $normalized
}

$result | ConvertTo-Json -Depth 4 | Out-File $OutputFile -Encoding UTF8

Write-Host "Normalized: $($result.normalized_count) / $($result.total_messages)"
Write-Host "Anomalies:  $($result.anomaly_count)"
Write-Host "Warnings:   $($warnings.Count)"
Write-Host "Output:     $OutputFile"

exit 0
