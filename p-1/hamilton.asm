.data
graph: .space 400
vis: .space 40
.text
li $v0, 5
syscall
add $s0, $v0, $0
li $v0, 5
syscall
add $s1, $v0, $0
li $s2, 1	#s2 is i, 1~s1
for_1_begin:
	blt $s1, $s2, for_1_end
	nop
	li $v0, 5
	syscall
	add $t0, $v0, $0
	li $v0, 5
	syscall
	add $t1, $v0, $0
	mult $t0, $s0
	mflo $t2
	add $t2, $t2, $t1
	li $t3, 4
	mult $t2, $t3
	mflo $t2
	la $t4, graph
	add $t4, $t4, $t2 
	li $t3, 1
	sw $t3, 0($t4)
	mult $t1, $s0
	mflo $t2
	add $t2, $t2, $t0
	li $t3, 4
	mult $t2, $t3
	mflo $t2
	la $t4, graph
	add $t4, $t4, $t2 
	li $t3, 1
	sw $t3, 0($t4)
	addi $s2, $s2, 1
	j for_1_begin
	nop
for_1_end:

add $a0, $s0, $0
li $a1, 1
li $a2, 1
jal dfs
nop
add $a0, $v0, $0
li $v0, 1
syscall
li $v0, 10
syscall

dfs: #a0 n, a1 p, a2 cnt 
sw $ra, 0($sp)
addi $sp, $sp, -4
sw $s0, 0($sp)
addi $sp, $sp, -4
sw $s1, 0($sp)
addi $sp, $sp, -4

li $t0, 4
mult $a1, $t0
mflo $t0
la $t1, vis
add $t1, $t1, $t0
li $t0, 1
sw $t0, 0($t1)

bne $a0, $a2, if_1_end
nop
	mult $a1, $a0
	mflo $t0
	addi $t0, $t0, 1
	li $t1, 4
	mult $t0, $t1
	mflo $t0
	la $t1, graph
	add $t1, $t1, $t0
	lw $t0, 0($t1)
	add $v0, $t0, $0
	j dfs_end
if_1_end:

li $s0, 1 #s0 is i, 1~a0
for_2_begin:
	bgt $s0, $a0, for_2_end
	nop
		mult $a1, $a0
		mflo $t0
		add $t0, $t0, $s0
		li $t1, 4
		mult $t0, $t1
		mflo $t0
		la $t1, graph
		add $t1, $t0, $t1
		lw $t0, 0($t1)
		li $t1, 4
		mult $s0, $t1
		mflo $t1
		la $t2, vis
		add $t2, $t2, $t1
		lw $t1, 0($t2)
		not $t1, $t1
		and $t0, $t0, $t1
		beqz $t0, if_2_end
		nop
			sw $a1, 0($sp)
			addi $sp, $sp, -4
			sw $a2, 0($sp)
			addi $sp, $sp, -4
			add $a1, $s0, $0
			addi $a2, $a2, 1
			jal dfs
			addi $sp, $sp, 4
			lw $a2, 0($sp)
			addi $sp, $sp, 4
			lw $a1, 0($sp)
			beqz $v0, if_3_end
			nop
				li $v0, 1
				j dfs_end
			if_3_end:
		if_2_end: 
	addi $s0, $s0, 1
	j for_2_begin
for_2_end:

li $t0, 4
mult $a1, $t0
mflo $t0
la $t1, vis
add $t1, $t1, $t0
sw $0, 0($t1)

add $v0, $0, $0

dfs_end:
addi $sp, $sp, 4
lw $s1, 0($sp)
addi $sp, $sp, 4
lw $s0, 0($sp)
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra
nop