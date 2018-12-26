.text 0x3000
begin:
li $s0, 0x7f40
li $s1, 0x7f2c
li $s2, 0x7f34
li $s3, 0x7f38

lw $s4, 0($s0)

#add
andi $t0, $s4, 0x1
beq $t0, $0, if_1_end
nop
	lw $t1, 0($s1)
	lw $t2, 4($s1)
	addu $t3, $t1, $t2
	sw $t3, 0($s2)
	sw $t3, 0($s3)
	j end
	nop
if_1_end:

#sub
andi $t0, $s4, 0x2
beq $t0, $0, if_2_end
nop
	lw $t1, 0($s1)
	lw $t2, 4($s1)
	subu $t3, $t1, $t2
	sw $t3, 0($s2)
	sw $t3, 0($s3)
	j end
	nop
if_2_end:

#and
andi $t0, $s4, 0x4
beq $t0, $0, if_3_end
nop
	lw $t1, 0($s1)
	lw $t2, 4($s1)
	and $t3, $t1, $t2
	sw $t3, 0($s2)
	sw $t3, 0($s3)
	j end
	nop
if_3_end:

#or
andi $t0, $s4, 0x8
beq $t0, $0, if_4_end
nop
	lw $t1, 0($s1)
	lw $t2, 4($s1)
	or $t3, $t1, $t2
	sw $t3, 0($s2)
	sw $t3, 0($s3)
	j end
	nop
if_4_end:

#xor
andi $t0, $s4, 0x10
beq $t0, $0, if_5_end
nop
	lw $t1, 0($s1)
	lw $t2, 4($s1)
	xor $t3, $t1, $t2
	sw $t3, 0($s2)
	sw $t3, 0($s3)
	j end
	nop
if_5_end:

end:
j begin
