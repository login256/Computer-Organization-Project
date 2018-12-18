.text
li $sp, 0x2333
li $2, 0x7fffffff
li $3, 0x7fffffff
li $4, 0x80000000

add $5, $2, $3
sub $5, $2, $4
addi $5, $2, 233

sw $2, 5($2)
lw $6, 5($2)

sw $2, 5($0)
sh $2, 5($0)

lw $6, 5($0)
lh $6, 5($0)
lhu $6, 5($0)

li $5, 0x7f00
lw $6, 8($5)
sw $6, 8($5)

j next
	add $5, $2, $3
next:

la $8 j_1_end
addi $8, $8, -1
jalr $8
nop
j_1_end:
nop

nop	#replace by RI

program_end:
j program_end
nop
