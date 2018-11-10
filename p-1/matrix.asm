.data
matrix: .space 10000
space: .asciiz " "
wrap: .asciiz "\n"
.text
li $v0, 5
syscall
add $s0, $0, $v0
li $v0, 5
syscall
add $s1, $0, $v0
mult $s0, $s1
mflo $s2
li $t0, 1	#t0 is i
for_1_begin:
	sle $t1, $t0, $s2
	beqz $t1, for_1_end
	nop
	li $v0, 5
	syscall
	la $t2, matrix
	add $t2, $t2, $t0
	li $t6, 4
	mult $t2, $t6
	mflo $t2
	sw $v0, 0($t2)
	addi $t0, $t0, 1
	j for_1_begin
	nop
for_1_end:
add $t0, $s0, $0	#t0 is i, s0~1
for_2_begin:
	slti $t2, $t0, 1
	blt $0, $t2, for_2_end
	nop
	add $t1, $s1, $0	#t1 is j, s1~1
	for_3_begin:
		slti $t2, $t1, 1
		blt $0,$t2, for_3_end
		nop
		addi $t3, $t0, -1
		mult $t3,$s1
		mflo $t3
		add $t3, $t3, $t1
		la $t4, matrix
		add $t4, $t4, $t3
		li $t6, 4
		mult $t4, $t6
		mflo $t4
		lw $t5, 0($t4)
			seq $t2, $t5, $0
			blt $0, $t2, if_1_end
			nop
			add $a0, $t0, $0
			li $v0, 1
			syscall
			la $a0, space
			li $v0, 4
			syscall
			add $a0, $t1, $0
			li $v0, 1
			syscall
			la $a0, space
			li $v0, 4
			syscall
			add $a0, $t5, $0
			li $v0, 1
			syscall
			la $a0, wrap
			li $v0, 4
			syscall
		if_1_end:
		addi $t1, $t1, -1
		j for_3_begin
	nop
	for_3_end:
	addi $t0, $t0, -1
	j for_2_begin
	nop
for_2_end:
li $v0, 10
syscall