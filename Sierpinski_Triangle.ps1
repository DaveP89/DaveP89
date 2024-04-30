[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$h = 1000
$w = 1000
$x = $w / 2
$y = $h / 2
$OLDx = 0
$OLDy = 0

$bmp = New-Object System.Drawing.Bitmap(($w + 2), ($h + 2) )

for ($i = 0; $i -lt 500000; $i++)
{
Try {
    $roll = Get-Random -Minimum 1 -Maximum 4
    $dice = [Math]::round($roll) 
    $OLDx = $x
    $OLDy = $y

    

        if ($dice -eq 1){
            $x = $OLDx / 2
            $y = (($h - $OLDy) / 2 ) + $OLDy

            $x= [Math]::round($x)
            $y = [Math]::round($y)
            $bmp.SetPixel($x, $y, 'Red')
        }

        if ($dice -eq 2){
            $y = $OLDy / 2 
            
            if ($x -lt ($w / 2)) {
                $x = $OLDx - (($OLDx - ($w / 2)) / 2 )
                }else{
                $x = $OLDx + ((($w / 2) - $OLDx) / 2 )
            }

            $x= [Math]::round($x)
            $y = [Math]::round($y)
            $bmp.SetPixel($x, $y, 'Blue')
        }

        if ($dice -eq 3){
            $y =[Math]::round( $OLDy + (($h - $OLDy) / 2))
            $x =[Math]::round( $OLDx + (($w - $OLDx) / 2))

            #$x= [Math]::round($x)
            #$y = [Math]::round($y)
            if (($x -lt $w) -AND ($x -gt 1)){
                $bmp.SetPixel($x, $y, 'Green')
                }
          # write-host "clean:  $x,  $y  : $dice"
            }

}
Catch {
    Write-Host $Error[0]
}
}

$bmp.Save("C:\Users\dave\Documents\Development\powershell\PS_Triangle.bmp")