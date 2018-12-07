#parser
#generate grid 11x8
#iterate through list and mark it
#count marks
$width = 1000
$length = 1000
$array = New-Object 'object[,]' $width,$length
$claims = gc .\day3.input
$fixedClaims = $claims.Replace(" ","")
$fixedClaims = $fixedClaims.Replace("#","")
$fixedClaims = $fixedClaims.Replace("@",",")
$fixedClaims = $fixedClaims.Replace(":",",")
$fixedClaims = $fixedClaims.Replace("x",",")
foreach ($claim in $fixedClaims) {
    $claim = $claim.split(",")
    $id = $claim[0]
    $startX = $claim[1]
    $startY = $claim[2]
    $rectX = $claim[3]
    $rectY = $claim[4]
    foreach ($x in 1..$rectX) {
        foreach ($y in 1..$rectY) {
            [int]$coordX = [int]$startX + [int]$x
            [int]$coordY = [int]$startY + [int]$y
            if ($array[$coordX,$coordY].Count -eq 0) {
                $array[$coordX,$coordY] = 1
            }
            else {
                $array[$coordX,$coordY] = 2
            }
        }
    }
}
$array | group | ? {2 -in $_.name} | Select -Property Count