.data
	array: .space 100
	symbol: .space 100
	space: .asciiz " "
	enter: .asciiz "\n"
.text
.macro read_int (%d)
	li $v0, 5
	syscall
	move %d, $v0
.end_macro

.macro print_int (%d)
	move $v1, $a0
	move $a0, %d
	li $v0, 1
	syscall
	move $a0, $v1
.end_macro

.macro print_str(%s)
	move $v1, $a0
	la $a0, %s
	li $v0, 4
	syscall
	move $a0, $v1
.end_macro

.macro exit
	li $v0, 10
	syscall 
.end_macro

.macro pop(%d)
	addi $sp, $sp, 4
	lw %d, 0($sp)
.end_macro

.macro push(%d)
	sw %d 0($sp)
	subi $sp, $sp, 4
.end_macro

main:
	read_int($s0)
	li $a0, 0
	jal FullArray
	nop
	
	exit

FullArray:
	push($ra)
	beq $a0, $s0, print
	nop
	li $t0, 0
	for_begin:
		beq $t0, $s0, for_end
		nop
		li $t1, 4
		mult $t0, $t1
		mflo $t2
		la $t1, symbol
		addu $t1, $t1, $t2 #symbol[i]
		lw $t2, 0($t1)
		bne $t2, $zero, continue
		nop
		li $t2, 4
		mult $a0, $t2
		mflo $t2
		la $t3, array
		addu $t2, $t2, $t3 ## array[index]
		addi $t3, $t0, 1 ## i+1
	
		sw $t3, 0($t2) ## array[index] = i+1
		li $t4, 1
		sw $t4, 0($t1) ## symbol[i]=1
		
		push($t0)
		push($t1)
		addi $a0, $a0, 1
		jal FullArray
		nop
		subi $a0, $a0, 1
		pop($t1)
		pop($t0)
		li $t4, 0
		sw $t4, 0($t1)
		continue:
		addi $t0, $t0, 1
		j for_begin
		nop
	for_end:
	pop($ra)
	jr $ra
print:
	li $t0, 0
	la $t1, array
	while_begin:
		beq $t0, $s0, while_end
		nop
		lw $t2, 0($t1)
		print_int($t2)
		print_str(space)
		addi $t1, $t1, 4
		addi $t0, $t0, 1
		j while_begin
		nop
	while_end:
	print_str(enter)
	pop($ra)
	jr $ra
