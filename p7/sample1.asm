.text
li $3 0x7fffffff
li $2 0x7fffffff
add $4, $2, $3
addi $5, $2, 233
sw $2, 5($2)
lw $6, 5($2)
sw $3, 5($0)
lw $7, 5($0)
li $8 0x3001
jr $8
nop
jr $2
nop
jalr $8
nop
jalr $2
nop