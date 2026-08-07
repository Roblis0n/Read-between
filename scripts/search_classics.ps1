# search_classics.ps1
# Search classical Chinese corpus for keywords, returning matching lines with context.
# Part of the Read Between classical self-service layer.
# Used by the agent for first-pass rough filtering before deep-reading original texts.

param(
    [Parameter(Mandatory=$true)]
    [string[]]$Query,              # Search keywords (multiple, OR logic)

    [Parameter(Mandatory=$false)]
    [string]$CorpusRoot,           # Corpus directory, default = $PSScriptRoot\..\references\classical-corpus

    [Parameter(Mandatory=$false)]
    [string[]]$IncludeFiles,       # Limit search to specific filenames, empty = all .md files

    [Parameter(Mandatory=$false)]
    [int]$ContextLines = 3,        # Context lines before and after each match

    [Parameter(Mandatory=$false)]
    [int]$MaxResults = 40          # Maximum results to return
)

# ---------------------------------------------------------------------------
# 1. Resolve and validate CorpusRoot
# ---------------------------------------------------------------------------
if (-not $CorpusRoot) {
    $CorpusRoot = Join-Path $PSScriptRoot "..\references\classical-corpus"
}

try {
    $CorpusRoot = Resolve-Path $CorpusRoot -ErrorAction Stop
}
catch {
    Write-Error "search_classics: CorpusRoot does not exist or cannot be resolved: $CorpusRoot"
    exit 1
}

if (-not (Test-Path $CorpusRoot -PathType Container)) {
    Write-Error "search_classics: CorpusRoot is not a directory: $CorpusRoot"
    exit 1
}

Write-Host "search_classics: Corpus root = $CorpusRoot" -ForegroundColor Gray

# ---------------------------------------------------------------------------
# 2. Build file list
# ---------------------------------------------------------------------------
$mdFiles = Get-ChildItem -Path $CorpusRoot -Filter "*.md" -File

if ($IncludeFiles) {
    $mdFiles = $mdFiles | Where-Object { $_.Name -in $IncludeFiles }
    Write-Host "search_classics: Searching $($mdFiles.Count) specified file(s)" -ForegroundColor Gray
}
else {
    Write-Host "search_classics: Searching all $($mdFiles.Count) .md file(s) in corpus" -ForegroundColor Gray
}

if ($mdFiles.Count -eq 0) {
    Write-Host "NO_MATCHES"
    exit 0
}

# ---------------------------------------------------------------------------
# 3. Build regex pattern from queries (OR logic, case-insensitive)
# ---------------------------------------------------------------------------
$escapedQueries = $Query | ForEach-Object { [regex]::Escape($_) }
$regexPattern = '(' + ($escapedQueries -join '|') + ')'

Write-Host "search_classics: Query count = $($Query.Count), ContextLines = $ContextLines, MaxResults = $MaxResults" -ForegroundColor Gray

# ---------------------------------------------------------------------------
# 4. Search all files with Select-String (fast, single invocation)
# ---------------------------------------------------------------------------
$allMatches = Select-String -Path $mdFiles.FullName -Pattern $regexPattern -Context $ContextLines

if ($allMatches.Count -eq 0 -or $null -eq $allMatches) {
    Write-Host "NO_MATCHES"
    exit 0
}

Write-Host "search_classics: Raw matches found = $($allMatches.Count)" -ForegroundColor Gray

# ---------------------------------------------------------------------------
# 5. Deduplicate by filename + line number
# ---------------------------------------------------------------------------
$seen = @{}
$uniqueMatches = foreach ($m in $allMatches) {
    $fileName = Split-Path $m.Path -Leaf
    $key = "$fileName|$($m.LineNumber)"
    if (-not $seen.ContainsKey($key)) {
        $seen[$key] = $true
        $m
    }
}

Write-Host "search_classics: Unique matches after dedup = $($uniqueMatches.Count)" -ForegroundColor Gray

# ---------------------------------------------------------------------------
# 6. Sort by filename, then line number
# ---------------------------------------------------------------------------
$sorted = $uniqueMatches | Sort-Object @{Expression={Split-Path $_.Path -Leaf}}, @{Expression={$_.LineNumber}}

# ---------------------------------------------------------------------------
# 7. Cap at MaxResults
# ---------------------------------------------------------------------------
$totalMatches = @($sorted).Count
$truncated = $totalMatches -gt $MaxResults

if ($truncated) {
    $sorted = $sorted | Select-Object -First $MaxResults
}

# ---------------------------------------------------------------------------
# 8. Output results (tab-separated, one per line)
# ---------------------------------------------------------------------------
foreach ($m in $sorted) {
    $fileName = Split-Path $m.Path -Leaf
    $preContext = ($m.Context.DisplayPreContext -join "|")
    $postContext = ($m.Context.DisplayPostContext -join "|")
    $matchedLine = $m.Line.Trim()
    "{0}`t{1}`t{2}`t{3}`t{4}" -f $fileName, $m.LineNumber, $matchedLine, $preContext, $postContext
}

# ---------------------------------------------------------------------------
# 9. Truncation notice (final line, different format so parsers can distinguish)
# ---------------------------------------------------------------------------
if ($truncated) {
    Write-Host "RESULTS_TRUNCATED: Found more than $MaxResults matches ($totalMatches total)" -ForegroundColor Yellow
}

exit 0
