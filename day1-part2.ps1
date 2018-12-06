[int]$Frequency = 0
$ListOfFrequencies = New-Object 'System.Collections.Generic.HashSet[int]'
$ListOfFrequencies.Add(0) | Out-Null
while ($true) {
    foreach ($Line in (Get-Content .\day1.input)) {
        if ($Line[0] -eq "+") {
            $Frequency = $Frequency + [int]$Line.trim("+")
        }
        else {
            $Frequency = $Frequency + [int]$Line
        }
        if (-not ($ListOfFrequencies.Add($Frequency))) {
            Write-Output $Frequency
            exit
        }
    }
}