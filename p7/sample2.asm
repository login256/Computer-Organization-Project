.text
li $s1, 0x7fffffff
li $s2, 0x7fffffff
mfc0 $t0, $12
ori $t0, $t0, 0xfc01
mtc0 $t0, $12
li $t0, 0x7f00
li $t1 2
sw $t1, 4($t0)
li $t1, 11
sw $t1, 0($t0)
nop
nop
nop
nop
nop
add $s3, $s1, $s2
nop
nop
nop
nop
nop
nop
nop
