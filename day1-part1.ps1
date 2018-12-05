[int]$frequency = 0

foreach ($line in (Get-Content .\day1.input)) {
    if ($line[0] -eq "+") {
        $frequency = $frequency + [int]$line.trim("+")
    }
    else {
        $frequency = $frequency + [int]$line
    }
}
$frequency