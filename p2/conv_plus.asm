.data
A: .space 600
B: .space 600
C: .space 600
space: .asciiz " "
newline: .asciiz "\n"
.text

li $v0, 5
syscall
add $s0, $v0, $0	#read n1

li $v0, 5
syscall
add $s1, $v0, $0	#read m1

li $v0, 5
syscall
add $s2, $v0, $0	#read n2

li $v0, 5
syscall
add $s3, $v0, $0	#read m2

li $s4, 0	#s4 is i
for_1_begin:
slt $t0, $s4, $s0
beq $t0, $0, for_1_end	#for i = 0 to n1-1
nop

	li $s5, 0	#s5 is j
	for_2_begin:
	slt $t0, $s5, $s1
	beq $t0, $0, for_2_end	#for j = 0 to m1-1
	nop
		mult $s4, $s1
		mflo $t0
		add $t0, $t0, $s5
		sll $t0, $t0, 2	#t0 is m1*i+j<<2
		la $t1, A
		add $t0, $t0, $t1
		li $v0, 5
		syscall
		sw $v0, 0($t0)	#read to A[i][j]
	addi $s5, $s5, 1
	j for_2_begin
	for_2_end:
	
addi $s4, $s4, 1
j for_1_begin
for_1_end:

li $s4, 0	#s4 is i
for_3_begin:
slt $t0, $s4, $s2
beq $t0, $0, for_3_end	#for i = 0 to n2-1
nop

	li $s5, 0	#s5 is j
	for_4_begin:
	slt $t0, $s5, $s3
	beq $t0, $0, for_4_end	#for j = 0 to m2-1
	nop
		mult $s4, $s3
		mflo $t0
		add $t0, $t0, $s5
		sll $t0, $t0, 2	#t0 is m2*i+j<<2
		la $t1, B
		add $t0, $t0, $t1
		li $v0, 5
		syscall
		sw $v0, 0($t0)	#read to B[i][j]
	addi $s5, $s5, 1
	j for_4_begin
	for_4_end:
	
addi $s4, $s4, 1
j for_3_begin
for_3_end:

li $s4, 0
for_5_begin:
sub $t0, $s0, $s2
addi $t0, $t0, 1
slt $t0, $s4, $t0
beq $t0, $0, for_5_end	#for i = 0 to n1-n2+1-1
	
	li $s5, 0
	for_6_begin:
	sub $t0, $s1, $s3
	addi $t0, $t0, 1
	slt $t0, $s5, $t0
	beq $t0, $0, for_6_end	#for j = 0 to m1-m2+1-1
		
		li $t8, 0	#t8 is lo
		li $t9, 0	#t9 is hi
		
		li $s6, 0
		for_7_begin:
		slt $t0, $s6, $s2
		beq $t0, $0, for_7_end	#for k = 0 to n2-1
			
			li $s7, 0
			for_8_begin:
			slt $t0, $s7, $s3
			beq $t0, $0, for_8_end	#for l=0 to m2-1
				
				add $t0, $s4, $s6
				mult $t0, $s1
				mflo $t0
				add $t0, $t0, $s5
				add $t0, $t0, $s7
				sll $t0, $t0, 2
				la $t2, A
				add $t0, $t0, $t2
				lw $t0, 0($t0)	#get A[i+k][j+l]
				
				mult $s6, $s3
				mflo $t1
				add $t1, $t1, $s7
				sll $t1, $t1, 2
				la $t2, B
				add $t1, $t1, $t2
				lw $t1, 0($t1)	#get B[k][l]
				
				mult $t0, $t1
				mflo $t0
				mfhi $t1	#A[i+k][j+l]*B[k][l]
				
				addu $t7, $t0 ,$t8
				sltu $t2, $t7, $t8
				sltu $t3, $t7, $t0
				or $t2, $t2, $t3
				beq $t2, $0, if_1_end	#if(t0<t7||t8<t7)
					addiu $t1, $t1, 1	#lo overflow
				if_1_end:
				add $t8, $t7, 0	#lo
				addu $t9, $t9, $t1	#hi
									#C[i][j]+=A[i+k][j+l]*B[k][l]
				
			addi $s7, $s7, 1
			j for_8_begin
			for_8_end:
			
		addi $s6, $s6, 1
		j for_7_begin
		for_7_end:
		
		add $a0, $t9, $0
		li $v0, 35
		syscall	#print	C[i][j]_hi
		
		add $a0, $t8, $0
		li $v0, 35
		syscall	#print	C[i][j]_lo
		
		la $a0, space
		li $v0, 4
		syscall	#print " "
		
	addi $s5, $s5, 1
	j for_6_begin
	for_6_end:
	
	la $a0, newline
	li $v0, 4
	syscall	#print "\n"
	
addi $s4, $s4, 1
j for_5_begin
for_5_end:



li $v0,10
syscall
