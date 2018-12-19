$filename="sample4"

#java -jar '.\Mars2018 .jar' $filename".asm" nc a db mc CompactDataAtZero dump 0x00003000-0x0000417C HexText ".\mips\IO\code.txt"

java -jar Mars.jar 5000000 $filename".asm" nc db mc CompactDataAtZero | Out-File -Encoding ascii $filename"_stdout.txt"

Compare-Object $(Get-Content $filename"_out.txt") $(Get-Content $filename"_stdout.txt")