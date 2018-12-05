ori $28, $0, 0x1234
ori $29, $0, 0x5678
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
lui $31, 0x1234
mfhi $30
j_11:
addu $1, $30, $31
nop
