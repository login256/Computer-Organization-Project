.text
li $s0, 0x1000
li $t0, 0x12345678
sw $t0, 0($s0)
sh $t0, 6($s0)
sb $t0, 9($s0)

li $s1, 0x7f38
lw $t1, 0($s0)
sw $t1, 0($s1)
lh $t1, 6($s0)
sw $t1, 0($s1)
lb $t1, 9($s0)
sw $t1, 0($s1)