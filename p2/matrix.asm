.data
A: .space 400
B: .space 400
C: .space 400
space: .asciiz " "
newline: .asciiz "\n"
.text
li $v0, 5
syscall
add $s0, $v0, $0	#$s0 is n

li $s1, 1	#s1 is i
for_1_begin:
sle $t0, $s1, $s0
beq $t0, $0, for_1_end	#for i = 1 to n
nop

	li $s2, 1	#s2 is j
	for_2_begin:
	sle $t0, $s2, $s0
	beq $t0, $0, for_2_end	#for j = 1 to n
	nop
		mult $s1, $s0
		mflo $t0
		add $t0, $t0, $s2
		sll $t0, $t0, 2	#t0 is n*i+j<<2
		la $t1, A
		add $t0, $t0, $t1
		li $v0, 5
		syscall
		sw $v0, 0($t0)	#read to A[i][j]
	addi $s2, $s2, 1
	j for_2_begin
	for_2_end:
	
addi $s1, $s1, 1
j for_1_begin
for_1_end:


li $s1, 1	#s1 is i
for_3_begin:
sle $t0, $s1, $s0
beq $t0, $0, for_3_end	#for i = 1 to n
nop

	li $s2, 1	#s2 is j
	for_4_begin:
	sle $t0, $s2, $s0
	beq $t0, $0, for_4_end	#for j = 1 to n
	nop
		mult $s1, $s0
		mflo $t0
		add $t0, $t0, $s2
		sll $t0, $t0, 2	#t0 is n*i+j<<2
		la $t1, B
		add $t0, $t0, $t1
		li $v0, 5
		syscall
		sw $v0, 0($t0)	#read to B[i][j]
	addi $s2, $s2, 1
	j for_4_begin
	for_4_end:
	
addi $s1, $s1, 1
j for_3_begin
for_3_end:

li $s1, 1	#s1 is i
for_5_begin:
sle $t0, $s1, $s0
beq $t0, $0, for_5_end	#for i = 1 to n
nop

	li $s2, 1	#s2 is j
	for_6_begin:
	sle $t0, $s2, $s0
	beq $t0, $0, for_6_end	#for j = 1 to n
	nop
		li $s4, 0	#curcnt=0
	
		li $s3, 1	#s3 is k
		for_7_begin:
		sle $t0, $s3, $s0
		beq $t0, $0, for_7_end	#for k = 1 to n
		nop
			mult $s1, $s0
			mflo $t0
			add $t0, $t0, $s3
			sll $t0, $t0, 2		#t0 is n*i+k<<2
			la $t1, A
			add $t0, $t0, $t1
			lw $t2, 0($t0)	#get A[i][k]
			
			mult $s3, $s0
			mflo $t0
			add $t0, $t0, $s2
			sll $t0, $t0, 2		#t0 is n*k+j<<2
			la $t1, B
			add $t0, $t0, $t1
			lw $t3, 0($t0)	#get B[k][j]
			
			mult $t2, $t3
			mflo $t1
			add $s4, $s4, $t1	#curcnt+=A[i][k]*B[k][j]
			
		addi $s3, $s3, 1
		j for_7_begin
		for_7_end:
		add $a0, $s4, $0
		li $v0, 1
		syscall
		la $a0, space
		li $v0, 4
		syscall
	addi $s2, $s2, 1
	j for_6_begin
	for_6_end:
	
	la $a0, newline
	li $v0, 4
	syscall
addi $s1, $s1, 1
j for_5_begin
for_5_end:

li $v0,10
syscall