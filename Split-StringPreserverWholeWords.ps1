function Split-StringPreserverWholeWords {
    param(
        [Parameter(Mandatory = $true)]
        [string]$String,
        [int]$SplitLength = $string.length / 2,
        [switch]$FindSmallestDivider,
        [string]$Divider=' ',
        $OldString
    )    
    if (!$OldString) {
        $OldString = $string
    }
    $global:myvar = $null
    $return = if ($string.Length -gt $splitLength) {
        $lastIndex = ($string[0..$splitLength] -join '').LastIndexOf($Divider)
        if ($lastIndex -eq $null -or $lastIndex -le 0) {
            if ($FindSmallestDivider -and $i -ne $SplitLength) {
                $i = $splitLength
                while ($SplitLength -lt $OldString.length) {                                        
                    try {
                        Split-StringPreserverWholeWords -string $OldString -SplitLength $i -FindSmallestDivider:$false -Divider $Divider | out-null 
                        Write-Warning "Split failed. Smallest divider is $i"                                                
                        [int]$global:myvar = $i
                        return $i
                    }
                    catch {
                        $i++                        
                    }
                    
                }
            }
            else {
                throw "Split not possible"
                break
            }
        }
        $newString = ($string[0..$lastIndex] -join '')
        $newString.trim()
        if ($string.Length - $newString.Length -gt $splitLength) {
            Split-StringPreserverWholeWords -string ($string[$($lastIndex+1)..$($string.Length)] -join '').trim() -splitLength $splitLength -OldString $OldString -FindSmallestDivider:$FindSmallestDivider -Divider $Divider
        } 
        else{
            $string[$($lastIndex+1)..$($string.Length)] -join ''
        }    
    }
    else {
        $string
    }
    if ($global:myvar){
        return [int]$global:myvar        
    }
    else{
        $return
    }
}
