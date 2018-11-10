.data
arr .space 40000
.text

main:

li $v0, 5
syscall
move $s0, $v0	#read n

li $s1, 1
for_1_begin:
slt $t0, $s0, $s1
bne $t0, $0, for_1_end	#for i = 1 to n
	
	li $t0, 4
	mult $s1, $t0
	mflo $t0
	la $t1, arr
	add $t0, $t0, $t1	#&(arr[i]) 
	
	li $v0, 5
	syscall
	sw $v0, 0($t0)	#read arr[i]
	
addi $s1, $s1, 1
j for_1_begin
for_1_end:

li $s1, 1
for_2_begin:
slt $t0, $s1, $s0
bne $t0, $0, for_2_end

addi $s1, $s1, 4
j for_2_begin
for_2_end:
