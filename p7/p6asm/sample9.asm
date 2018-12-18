lui $s0, 0x1234
ori $s0, $0, 0x9124
lui $s1, 0x7abe
ori $s1, $0, 0x1263
lui $s2, 0x152
ori $s2, $0, 0x152f
lui $s3, 0x12
ori $s3, $0, 0xaefb
ori $2, $0, 0x30fc
ori $3, $0, 0x31a8

lui $s4, 0x8123
ori $s4, $0, 0xabef
lui $s5, 0xab2f
ori $s5, $0, 0x1932
lui $s6, 0xf321
ori $s6, $0, 0xffef
lui $s7, 0xffff
ori $s7, $0, 0x1352

sw $s0, 0($zero)
sw $s1, 4($zero)
sw $s2, 8($zero)
sw $s3, 12($zero)
sw $s4, 16($zero)
sw $s5, 20($zero)
sw $s6, 24($zero)
sw $s7, 28($zero)
ori $t9, $0, 12
lui $t0, 12512
ori $t2, $t3, -1354

nop
lb $t6, 8($t9)

mult $s6, $s3
lhu $t7, -8($t9)
xor $t0, $t0, $s2
ori $t9, $zero, 12
xori $t0, $t0, -19242
lb $t0, 5($t9)
sra $t4, $s6, 16
blez $t1, BLEZ2
nop
and $t0, $t0, $s7
srav $t0, $s2, $t0
BLEZ2:
mflo $t6
lhu $t6, 8($t9)
mult $s5, $s6
multu $s0, $s2
sh $t6, 8($t9)
or $t0, $t0, $s2
lh $t4, 6($t9)
or $t0, $t0, $s3
nor $t0, $t0, $s3
srl $t5, $s7, 30
mflo $t4
mfhi $t3
sh $t3, -4($t9)
mfhi $t3
mfhi $t5
ori $t1, $s7, -1345
sltiu $t2, $s4, 13252
addu $t0, $t0, $s7
sub $t0, $t0, $s2
sb $t2, 6($t9)
srl $t3, $s5, 12
nor $t0, $t0, $s6
andi $t2, $t3, -1354
lb $t7, -8($t9)
or $t0, $s0, $s1
mfhi $t7
sll $t0, $s1, 9
bne $t0, $t0, BNE1
nop
ori $t9, $zero, 12
BNE1:
multu $s5, $s2
sltu $t3, $s7, $s4
addi $t1, $s7, -1345
sb $t8, 9($t9)
lbu $t7, -8($t9)
lbu $t1, -5($t9)
xori $t2, $s4, 13252
sb $t0, -9($t9)

lh $t3, -4($t9)
bltz $t0, BLTZ1
nop
mfhi $t1
BLTZ1:
mflo $t6
srl $t1, $s2, 20
lw $t0, -8($t9)
divu $s6, $s3
add $t0, $t0, $s5
ori $t0, $t0, -19242
srlv $t0, $t0, $t0
lui $t3, 135
sllv $t0, $s1, $s2
lbu $t5, -7($t9)
sub $t0, $s0, $s1
sltiu $t0, $t0, -19242
mflo $t2
mfhi $t3
bgez $t0, BGTZ1
nop
ori $t1, $s3, 14321
BGTZ1:
sw $t1, 8($t9)
nor $t0, $t0, $s5
srlv $t0, $s2, $t0
sltu $t1, $s0, $s2
sll $t4, $s6, 16
xor $t0, $t0, $s4
sltiu $t2, $t3, -1354
add $t0, $s0, $s1
beq $t0, $t0, BEQ2
nop
multu $s6, $s3
BEQ2:
sb $t4, 7($t9)
mult $s0, $s2
mflo $t8
divu $s7, $s6
sh $t4, 6($t9)
ori $t0, $s0, 1253
and $t0, $t0, $s2
slti $t1, $s7, -1345
divu $s0, $s5
mflo $t2
divu $s0, $s1
multu $s5, $s6
jal JAL2
nop
lh $t5, -6($t9)
JAL2:
andi $t2, $s4, 13252
nor $t0, $t0, $s2
xor $t0, $t0, $s7
lbu $t4, 7($t9)
sh $t7, -8($t9)
addi $t0, $s0, 1253
srlv $t0, $s1, $s2
multu $s0, $s1
slt $t4, $s6, $s7
divu $s0, $s7
lhu $t1, -2($t9)
addi $t0, $t0, -19242
multu $s7, $s6
ori $t9, $zero, 12
lui $t1, 1352
mult $s0, $s1
mflo $t8
mult $s0, $s7
sltiu $t1, $s3, 14321
or $t0, $t0, $s4
nor $t0, $t0, $s7
ori $t9, $zero, 40
divu $s0, $s2
sb $t5, -7($t9)
lb $t2, 6($t9)
slt $t0, $s0, $s1
srlv $t0, $s3, $t0
and $t0, $t0, $s6
lui $t2, 62345
sub $t0, $t0, $s7
slti $t0, $s0, 1253
srl $t2, $s3, 8
addu $t0, $t0, $s4
ori $t9, $zero, 40
srl $t0, $s1, 9
and $t0, $s0, $s1
xor $t0, $s0, $s1
div $s6, $s3
lw $t2, -4($t9)
lb $t8, 9($t9)
andi $t0, $t0, -19242
sra $t5, $s7, 30
divu $s5, $s6
j J2
nop
xori $t1, $s7, -1345
J2:
lb $t0, -9($t9)
j J1
nop
ori $t9, $zero, 12
addiu $t1, $s7, -1345
J1:
jal JAL1
nop
addiu $t0, $s0, 1253
JAL1:
mult $s0, $s5
sll $t2, $s3, 8
sh $t0, 2($t9)
lh $t1, -2($t9)
mfhi $t1
addiu $t1, $s3, 14321
lh $t7, -8($t9)
sw $t3, 4($t9)
andi $t1, $s7, -1345
lw $t1, 8($t9)
slt $t2, $t0, $t1
sllv $t0, $t0, $t0
sw $t4, ($t9)
bgez $t1, BGEZ2
nop
sh $t1, -2($t9)
BGEZ2:
sltiu $t1, $s7, -1345
xori $t0, $s0, 1253
mfhi $t3
or $t0, $t0, $s7

lw $t3, 4($t9)
div $s0, $s7
mflo $t4
bne $t1, $t1, BNE2
nop
srav $t0, $s1, $s2
BNE2:
lb $t1, -5($t9)
andi $t1, $s3, 14321
sra $t3, $s5, 12
sltiu $t0, $s0, 1253
bgez $t0, BGEZ1
nop
sll $t1, $s2, 20
BGEZ1:
lbu $t0, 5($t9)
addi $t2, $s4, 13252
slti $t0, $t0, -19242
beq $t0, $t1, BEQ1
nop
sb $t0, 5($t9)
BEQ1:
sltu $t5, $t3, $t4
lbu $t2, 6($t9)
and $t0, $t0, $s4
div $s0, $s1
sra $t2, $s3, 8
lh $t0, 2($t9)
addiu $t0, $t0, -19242
mult $s5, $s2
sb $t3, -6($t9)
sra $t1, $s2, 20
lbu $t8, 9($t9)
div $s7, $s6

div $s5, $s2
mflo $t8
div $s0, $s5
sltu $t0, $s0, $s1
divu $s5, $s2
addiu $t2, $t3, -1354
mfhi $t7
div $s5, $s6
lhu $t2, 4($t9)
lb $t3, -6($t9)
lbu $t3, -6($t9)
sra $t0, $s1, 9
sb $t7, -8($t9)
addi $t1, $s3, 14321
slti $t1, $s3, 14321
lw $t4, ($t9)

blez $t0, BLEZ1
nop
nor $t0, $t0, $s4
BLEZ1:
mfhi $t1
xori $t1, $s3, 14321
slti $t2, $s4, 13252
andi $t0, $s0, 1253
sh $t5, -6($t9)

bne $t3, $t4, BNE3
nop
slt $t3, $s7, $s4
BNE3:
sh $t2, 4($t9)
slt $t5, $t3, $t4
slti $t2, $t3, -1354
srav $t0, $t0, $t0
mfhi $t5
sltu $t4, $s6, $s7
sub $t0, $s0, $s1
mflo $t8
and $t0, $t0, $s5
mflo $t2
sb $t6, 8($t9)
lhu $t0, 2($t9)
bltz $t1, BLTZ2
nop
lhu $t4, 6($t9)
BLTZ2:
srav $t0, $s3, $t0
sub $t0, $s0, $s6
xori $t2, $t3, -1354
sll $t5, $s7, 30
lbu $t6, 8($t9)
mfhi $t1
lb $t5, -7($t9)
mfhi $t7
lhu $t3, -4($t9)
ori $t9, $zero, 12
add $t0, $t0, $s6
lh $t6, 8($t9)
mflo $t4
mflo $t4
sw $t2, -4($t9)
and $t0, $t0, $s3
nor $t0, $s0, $s1
slt $t1, $s0, $s2
xor $t0, $t0, $s5
or $t0, $t0, $s6
sub $t0, $t0, $s7
sub $t0, $s0, $s6
add $t0, $t0, $s2
sltu $t2, $t0, $t1
mflo $t6
sllv $t0, $s3, $t0
lh $t2, 4($t9)
or $t0, $t0, $s5
div $s0, $s2
sll $t3, $s5, 12
mflo $t6
mfhi $t5
xor $t0, $t0, $s3
mult $s7, $s6
addi $t2, $t3, -1354
mfhi $t7
xor $t0, $t0, $s6
sw $t0, -8($t9)
sub $t0, $t0, $s2
bgez $t1, BGTZ2
nop
sllv $t0, $s2, $t0
BGTZ2:

multu $s0, $s7
mfhi $t5
ori $t9, $zero, 40

bne $t5, $t6, BNE4
nop
mflo $t2
BNE4:
lhu $t5, -6($t9)
lui $t4, 13523
ori $t2, $s4, 13252
addiu $t2, $s4, 13252
multu $s0, $s5
srl $t4, $s6, 16
sb $t1, -5($t9)
lbu $t0, -9($t9)
addu $t0, $s0, $s0

lb $t4, 7($t9)
ori $2, $0, 0x3584
jr $2
nop
ori $3, $0, 0x3590
jr $3
nop
ori $2, $0, 0x359c
jalr $s1, $2
nop
ori $3, $0, 0x35a8
jalr $t0, $3
nop
addu $t0, $t0, $s3
