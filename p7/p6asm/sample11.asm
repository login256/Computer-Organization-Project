li $2 -4566458
li $3 3465434
mult $2 $3
mfhi $4
mflo $5
mfhi $4
mflo $5
multu $2 $3
mfhi $4
mflo $5
mfhi $4
mflo $5
li $1 0
multu $2 $3
mthi $2
mfhi $4
mflo $5
mfhi $4
mflo $5
li $1 0
mult $2 $3
mtlo $3
mfhi $4
mflo $5
mfhi $4
mflo $5
mthi $1
mfhi $4
mtlo $1
mflo $4
li $6 0x23333333
sw $6 8($0)
lw $7 8($0)
mthi $7
mfhi $4
li $6 0x66666
li $1 8
sw $6 12($1)
lw $7 12($1)
mtlo $7
mflo $4
mult $2 $3
mfhi $4
div $2 $3
mfhi $4
mflo $5
divu $2 $3
mfhi $4
mflo $5