# Split-StringPreserverWholeWords
Powershell function to split a string by a given length with preservation of whole words

## EXAMPLE 1
Split long string to smaller strings with max length of 30
```powershell
PS > $string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras id dolor libero. Vestibulum mattis consectetur lacus et gravida. Donec laoreet, augue in vestibulum sollicitudin, leo turpis pretium ipsum, sit amet tincidunt diam ipsum in orci. Proin dictum dolor ut neque sollicitudin, eu mollis magna pellentesque. Morbi convallis eros nec urna commodo, et molestie justo eleifend. Curabitur odio mauris, tincidunt et mauris nec, malesuada tincidunt eros. Nam fermentum tristique quam, sollicitudin lacinia ligula gravida nec. Suspendisse potenti."

PS > Split-StringPreserverWholeWords -string $string -SplitLength 30 

Lorem ipsum dolor sit amet,
consectetur adipiscing elit.
Cras id dolor libero.
Vestibulum mattis consectetur
lacus et gravida. Donec
laoreet, augue in vestibulum
sollicitudin, leo turpis
pretium ipsum, sit amet
tincidunt diam ipsum in orci.
Proin dictum dolor ut neque
sollicitudin, eu mollis magna
pellentesque. Morbi convallis
eros nec urna commodo, et
molestie justo eleifend.
Curabitur odio mauris,
tincidunt et mauris nec,
malesuada tincidunt eros. Nam
fermentum tristique quam,
sollicitudin lacinia ligula
gravida nec. Suspendisse
```

