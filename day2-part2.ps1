$file = ".\day2.input"
[System.Collections.ArrayList]$toCheck = gc $file
foreach ($line in (gc $file)) {
    $toCheck.RemoveAt(0)
    foreach ($lineToCheck in $toCheck){
        $index = 0
        $diff = 0
        foreach ($char in [char[]]$line) {
            if ($char -ne $lineToCheck[$index]) {
                $diff +=1
                if ($diff -gt 1) {
                    break
                }
            }
            $index +=1
            if ($index -eq 26) {
                $index = 0
                [string]$output = ""
                foreach ($char in [char[]]$line) {
                    if ($char -eq $lineToCheck[$index]) {
                        $output = $output + $char
                    }
                    $index +=1
                }
                Write-Output $output
                Exit
            }
        }
    }
}