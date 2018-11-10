.data
str: .space 100
.text

li $v0, 5
syscall
add $s0, $v0, $0	#read n

li $s1 0
for_1_begin:
slt $t0, $s1, $s0
beq $t0, $0,for_1_end	#for i = 0 to n-1
nop
	sll $t0, $s1, 2
	la $t1, str
	add $t0, $t0, $t1
	li $v0, 12
	syscall
	sw $v0, 0($t0)	#read s[i]
addi $s1, $s1, 1
j for_1_begin 
for_1_end:

li $s2 1	#can=1

li $s1 0
for_2_begin:
slt $t0, $s1, $s0
beq $t0, $0,for_2_end	#for i = 0 to n-1
nop
	sll $t0, $s1, 2
	la $t1, str
	add $t0, $t0, $t1
	lw $t2, 0($t0)	#s[i]
	
	sub $t0, $s0, $s1
	addi $t0, $t0, -1	#n-i-1
	sll $t0, $t0, 2
	la $t1, str
	add $t0, $t0, $t1
	lw $t3, 0($t0)	#s[n-i-1]
	
	beq $t2, $t3, if_1_end	#if s[i]!=s[n-i-1]
	nop
		li $s2, 0
		j for_2_end	#break
	if_1_end:
	
addi $s1, $s1, 1
j for_2_begin 
for_2_end:

add $a0, $s2, $0
li $v0, 1
syscall	#print can

li $v0, 10
syscall