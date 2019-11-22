# Split-StringPreserverWholeWords
Powershell function to split a string by a given maximal length with preservation of whole words

### EXAMPLE 1
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

### EXAMPLE 2

Use switch FindSmallestDivider to show the smallest possible split length

```powershell
PS > Split-StringPreserverWholeWords -string $string -SplitLength 10 
Lorem
ipsum
dolor sit
amet,
Split not possible
At D:\Skrypty\Split-String.ps1:30 char:17
+                 throw "Split not possible"
+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : OperationStopped: (Split not possible:String) [], RuntimeException
    + FullyQualifiedErrorId : Split not possible
    
PS > Split-StringPreserverWholeWords -string $string -SplitLength 10 -FindSmallestDivider
Lorem
ipsum
dolor sit
amet,
WARNING: Split failed. Smallest divider is 13

````
### EXAMPLE 3
Use Divider parameter to use a custom divider string. Default is ' '
```powershell
PS > Split-StringPreserverWholeWords -string $string -SplitLength 47 -Divider u
Lorem ipsum dolor sit amet, consectetu
r adipiscing elit. Cras id dolor libero. Vestibu
lum mattis consectetur lacu
s et gravida. Donec laoreet, augue in vestibulu
m sollicitudin, leo turpis pretium ipsu
m, sit amet tincidunt diam ipsu
m in orci. Proin dictum dolor ut neque sollicitu
din, eu mollis magna pellentesqu
e. Morbi convallis eros nec u
rna commodo, et molestie justo eleifend. Cu
rabitur odio mauris, tincidunt et mau
ris nec, malesuada tincidunt eros. Nam fermentu
m tristique quam, sollicitudin lacinia ligu
````
