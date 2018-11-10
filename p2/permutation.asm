.data
arr: .space 40
use: .space 40
space: .asciiz " "
newline: .asciiz "\n"
.text
li $v0, 5
syscall
add $s0, $v0, 0

li $a0, 1
add $a1, $s0, $0
jal dfs

li $v0, 10
syscall	#end


dfs:
sw $ra, 0($sp)
addi $sp, $sp, -4
sw $s0, 0($sp)
addi $sp, $sp, -4
sw $s1, 0($sp)
addi $sp, $sp, -4
sw $s2, 0($sp)
addi $sp, $sp, -4
sw $s3, 0($sp)
addi $sp, $sp, -4
sw $s4, 0($sp)
addi $sp, $sp, -4

	add $s1, $a0, 0	#cur
	add $s2, $a1, 0	#n
	
	la $s3, arr	#arr
	
	slt $t0, $s2, $s1
	beq $t0, $0, if_1_end	#if(a0>a1)
		
		li $s0 1
		for_1_begin:
		slt $t0, $s2, $s0
		bne $t0, $0, for_1_end	#for i = 1 to s2
		
			addi $s3, $s3, 4
			lw $a0, 0($s3)
			li $v0, 1
			syscall	#print arr[i]
			
			la $a0, space
			li $v0, 4
			syscall	#print " "
			
		addi $s0, $s0, 1
		j for_1_begin
		for_1_end:
		
		la $a0, newline
		li $v0, 4
		syscall	#print "\n"
		
		j dfs_end
		
	if_1_end:
	
	la $s3, arr
	sll $t0, $s1, 2
	add $s3, $s3, $t0	#arr+cur*4
	
	la $s4, use	#use
	
	li $s0, 1
	for_2_begin:
	slt $t0, $s2, $s0
	bne $t0, $0, for_2_end	#for i = 1 to n
		
		addi $s4, $s4, 4
		lw $t0, 0($s4)
		bne $t0, $0, for_2_continue	#if use[i]!=0, continue
		
		sw $s0, 0($s3)
		li $t0, 1
		sw $t0, 0($s4)
		
		addi $a0, $s1, 1	#a0=cur+1
		add $a1, $s2, $0	#a1=n
		jal dfs
		
		li $t0, 0
		sw, $t0, 0($s4)
	
	for_2_continue:
	addi $s0, $s0, 1
	j for_2_begin
	for_2_end:
	
	
dfs_end:
addi $sp, $sp, 4
lw $s4, 0($sp)
addi $sp, $sp, 4
lw $s3, 0($sp)
addi $sp, $sp, 4
lw $s2, 0($sp)
addi $sp, $sp, 4
lw $s1, 0($sp)
addi $sp, $sp, 4
lw $s0, 0($sp)
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra