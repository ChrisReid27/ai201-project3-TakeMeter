$inputPath = 'Takemeter data - Sheet1.csv'
$outputPath = 'Takemeter data - cleaned.csv'

$rows = Import-Csv -LiteralPath $inputPath
$records = [System.Collections.Generic.List[object]]::new()
$pendingAuthor = $null
$pendingTimestamp = $null
$pendingText = [System.Collections.Generic.List[string]]::new()
$pendingScore = $null

function Test-Artifact([string]$value) {
    if ([string]::IsNullOrWhiteSpace($value)) { return $true }

    $trimmed = $value.Trim()
    if ($trimmed -in @('Collapse video player', 'Continue this thread', '1 more reply', '0:00 / 0:00', 'Shop Now', 'walmart.com')) { return $true }
    if ($trimmed -match '^u/.+\u2022Ad$') { return $true }
    if ($trimmed -match '^Give them a break') { return $true }
    return $false
}

function Add-Record([string]$text, [string]$author, [string]$timestamp, [string]$score) {
    if ([string]::IsNullOrWhiteSpace($text)) { return }
    $records.Add([pscustomobject]@{
        Text = $text
        Label = ''
        Notes = ''
        Author = $author
        Timestamp = $timestamp
        Score = $score
    })
}

function Flush-Pending {
    if ($null -ne $pendingAuthor -and $pendingText.Count -gt 0) {
        Add-Record ($pendingText -join "`n") $pendingAuthor $pendingTimestamp $pendingScore
    }
    $script:pendingAuthor = $null
    $script:pendingTimestamp = $null
    $script:pendingText = [System.Collections.Generic.List[string]]::new()
    $script:pendingScore = $null
}

for ($index = 0; $index -lt $rows.Count; $index++) {
    $value = [string]$rows[$index].TEXT
    if (Test-Artifact $value) { continue }

    $nextValue = if ($index + 1 -lt $rows.Count) { [string]$rows[$index + 1].TEXT } else { '' }
    $isTimestamp = $value.Trim() -match '^\u2022.* ago$'
    $isAuthor = -not [string]::IsNullOrWhiteSpace($value) -and $nextValue.Trim() -match '^\u2022.* ago$'
    $isScore = $value.Trim() -match '^-?\d+$'

    if ($isAuthor) {
        Flush-Pending
        $pendingAuthor = $value
        continue
    }

    if ($isTimestamp -and $null -ne $pendingAuthor -and $null -eq $pendingTimestamp) {
        $pendingTimestamp = $value
        continue
    }

    if ($isScore -and $null -ne $pendingAuthor) {
        $pendingScore = $value
        Flush-Pending
        continue
    }

    if ($null -ne $pendingAuthor) {
        $pendingText.Add($value)
    } else {
        Add-Record $value '' '' ''
    }
}

Flush-Pending
$records | Export-Csv -LiteralPath $outputPath -NoTypeInformation -Encoding utf8
Write-Output "Wrote $($records.Count) records to $outputPath"