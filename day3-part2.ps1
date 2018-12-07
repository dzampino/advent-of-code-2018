$width = 1000
$length = 1000
$array = New-Object 'object[,]' $width,$length
$claims = gc .\day3.input
$fixedClaims = $claims.Replace(" ","")
$fixedClaims = $fixedClaims.Replace("#","")
$fixedClaims = $fixedClaims.Replace("@",",")
$fixedClaims = $fixedClaims.Replace(":",",")
$fixedClaims = $fixedClaims.Replace("x",",")
$validClaims = @{}
foreach ($claim in $fixedClaims) {
    $claim = $claim.split(",")
    $id = $claim[0]
    $startX = $claim[1]
    $startY = $claim[2]
    $rectX = $claim[3]
    $rectY = $claim[4]
    $validClaims.Add($id,$true)
    foreach ($x in 1..$rectX) {
        foreach ($y in 1..$rectY) {
            [int]$coordX = [int]$startX + [int]$x
            [int]$coordY = [int]$startY + [int]$y
            if ($array[$coordX,$coordY].Count -eq 0) {
                $array[$coordX,$coordY] = $id
            }
            else {
                $validClaims.$id = $false
                $validClaims.($array[$coordX,$coordY]) = $false
            }
        }
    }
}
$validClaims.GetEnumerator() | ? {$_.Value -eq $true}