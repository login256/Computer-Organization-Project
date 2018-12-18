.text
li $sp, 0x2333
li $3 0x7fffffff
li $2 0x7fffffff
add $4, $2, $3
addi $5, $2, 233
sw $2, 5($2)
lw $6, 5($2)
sw $3, 5($0)
lw $7, 5($0)

la $8 j_1_end
addi $8, $8, -1
jalr $8
nop
j_1_end:
nop

program_end:
j program_end
nop
