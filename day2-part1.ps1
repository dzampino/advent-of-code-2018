$2char = 0
$3char = 0
foreach ($line in (gc .\day2.input)) {
    $letters = @{}
    foreach ($char in [char[]]$line) {
        if ($letters.Contains($char)) {
            $letters[$char] = $letters[$char] + 1
        }
        else {
            $letters.Add($char, 1)
        }
    }
    if ($letters.ContainsValue(2)) { $2char += 1}
    if ($letters.ContainsValue(3)) { $3char += 1}
}
$checksum = $2char * $3char
Write-Output $checksum