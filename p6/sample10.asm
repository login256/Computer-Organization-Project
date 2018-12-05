lui $t1, 0x1234
ori $t1, $t1, 0x5678

sb $t1,0($0)
sb $t1,1($0)
sb $t1,2($0)
sb $t1,3($0)

sh $t1,4($0)
sh $t1,6($0)
lb $t2, 0($0)

lui $t2, 0xffff
ori $t2, 0xffff
lb $t2, 1($0)

lui $t2, 0xffff
ori $t2, 0xffff
lb $t2, 2($0)

lui $t2, 0xffff
ori $t2, 0xffff
lb $t2, 3($0)

lui $t2, 0xffff
ori $t2, 0xffff
lh $t2, 0($0)

lui $t2, 0xffff
ori $t2, 0xffff
lh $t2, 2($0)

lui $t2, 0xffff
ori $t2, 0xffff
lbu $t2, 0($0)

lui $t2, 0xffff
ori $t2, 0xffff
lbu $t2, 1($0)

lui $t2, 0xffff
ori $t2, 0xffff
lbu $t2, 2($0)

lui $t2, 0xffff
ori $t2, 0xffff
lbu $t2, 3($0)

lui $t2, 0xffff
ori $t2, 0xffff
lhu $t2, 0($0)

lui $t2, 0xffff
ori $t2, 0xffff
lhu $t2, 2($0)

lui $t2, 0xffff
ori $t2, 0xffff
lw $t2, 0($0)
