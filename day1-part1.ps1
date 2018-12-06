[int]$Frequency = 0
foreach ($Line in (Get-Content .\day1.input)) {
    if ($Line[0] -eq "+") {
        $Frequency = $Frequency + [int]$Line.trim("+")
    }
    else {
        $Frequency = $Frequency + [int]$Line
    }
}
$Frequency