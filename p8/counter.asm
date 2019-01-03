.text 0x3000
#begin
li $t0, 0x500
li $t1, 1
sw $t1, 0($t0)

li $t0, 0x7f38
sw $0, 0($t0)
#set timer
mfc0 $t0, $12
ori $t0, $t0, 0xfc01
mtc0 $t0, $12
li $t0, 0x7f00
li $t1 50000000
sw $t1, 4($t0)
li $t1, 9
sw $t1, 0($t0)

loop:
j loop
nop
