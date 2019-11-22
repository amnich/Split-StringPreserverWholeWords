function Split-StringPreserverWholeWords {
    param(
        [Parameter(Mandatory = $true)]
        [string]$String,
        [int]$SplitLength = $string.length / 2,
        [switch]$FindSmallestDivider,
        $OldString
    )    
    if (!$OldString) {
        $OldString = $string
    }
    if ($string.Length -gt $splitLength) {
        $lastIndex = ($string[0..$splitLength] -join '').LastIndexOf(' ')
        if ($lastIndex -eq $null -or $lastIndex -le 0) {
            if ($FindSmallestDivider -and $i -ne $SplitLength) {
                $i = $splitLength
                while ($SplitLength -lt $OldString.length) {                                        
                    try {
                        Split-StringPreserverWholeWords -string $OldString -SplitLength $i -FindSmallestDivider:$false | out-null
                        Write-Warning "Split failed. Smallest divider is $i"
                        return                        
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
            Split-StringPreserverWholeWords -string ($string[$lastIndex..$($string.Length)] -join '').trim() -splitLength $splitLength -OldString $OldString -FindSmallestDivider
        }
    
    }
    else {
        $string
    }
}
