ori $28, $0, 0x1234
ori $29, $0, 0x5678
sw $29, 0($0)
lui $30, 0x1234
jal j_8
lw $31,0($0)
j_8:
addu $1, $30, $31