ori $28, $0, 0x1234
ori $29, $0, 0x5678
sw $29, 0($0)
mult $28, $29
lui $30, 0x1234
jal j_1
lui $31, 0x1234
mfhi $30
j_1:
beq $30, $31, next_1
nop
next_1:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
jal j_2
lui $31, 0x1234
mfhi $30
j_2:
addu $1, $30, $31
nop
next_2:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
jal j_3
lui $31, 0x1234
j_3:
sw $31, 4($0)
nop
next_3:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
jal j_4
addu $30, $28, $29
j_4:
beq $30, $31, next_4
nop
next_4:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
jal j_5
addu $30, $28, $29
mflo $30
j_5:
addu $1, $30, $31
nop
next_5:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
jal j_6
addu $30, $28, $29
mflo $30
j_6:
sw $31, 4($0)
nop
next_6:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
jal j_7
lw $31,0($0)
j_7:
beq $30, $31, next_7
nop
next_7:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
jal j_8
lw $31,0($0)
j_8:
addu $1, $30, $31
nop
next_8:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
jal j_9
lw $31,0($0)
j_9:
sw $31, 4($0)
nop
next_9:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
lui $31, 0x1234
mfhi $30
j_10:
beq $30, $31, next_10
nop
next_10:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
lui $31, 0x1234
mfhi $30
j_11:
addu $1, $30, $31
nop
next_11:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
lui $31, 0x1234
mflo $30
j_12:
sw $31, 4($0)
nop
next_12:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
addu $30, $28, $29
mfhi $30
j_13:
beq $30, $31, next_13
nop
next_13:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
subu $31, $29, $28
addu $30, $28, $29
j_14:
addu $1, $30, $31
nop
next_14:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
subu $31, $29, $28
addu $30, $28, $29
mflo $30
j_15:
sw $31, 4($0)
nop
next_15:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
lw $31,0($0)
mflo $30
j_16:
beq $30, $31, next_16
nop
next_16:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
lw $31,0($0)
mflo $30
j_17:
addu $1, $30, $31
nop
next_17:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
subu $31, $29, $28
lw $31,0($0)
mflo $30
j_18:
sw $31, 4($0)
nop
next_18:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
lw $31,0($0)
lui $31, 0x1234
j_19:
beq $30, $31, next_19
nop
next_19:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
lw $31,0($0)
lui $31, 0x1234
j_20:
addu $1, $30, $31
nop
next_20:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
lw $31,0($0)
lui $31, 0x1234
mflo $30
j_21:
sw $31, 4($0)
nop
next_21:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
lw $31,0($0)
addu $30, $28, $29
mflo $30
j_22:
beq $30, $31, next_22
nop
next_22:
nop
nop
nop
nop
nop
mult $28, $29
lui $30, 0x1234
lw $31,0($0)
addu $30, $28, $29
j_23:
addu $1, $30, $31
nop
next_23:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
lw $31,0($0)
addu $30, $28, $29
mfhi $30
j_24:
sw $31, 4($0)
nop
next_24:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
lw $31,0($0)
lw $31,0($0)
j_25:
beq $30, $31, next_25
nop
next_25:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
lw $31,0($0)
lw $31,0($0)
j_26:
addu $1, $30, $31
nop
next_26:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lui $30, 0x1234
lw $31,0($0)
lw $31,0($0)
j_27:
sw $31, 4($0)
nop
next_27:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
jal j_28
lui $31, 0x1234
j_28:
beq $30, $31, next_28
nop
next_28:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
jal j_29
lui $31, 0x1234
j_29:
addu $1, $30, $31
nop
next_29:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
jal j_30
lui $31, 0x1234
j_30:
sw $31, 4($0)
nop
next_30:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
jal j_31
addu $30, $28, $29
j_31:
beq $30, $31, next_31
nop
next_31:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
jal j_32
addu $30, $28, $29
mfhi $30
j_32:
addu $1, $30, $31
nop
next_32:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
jal j_33
addu $30, $28, $29
mfhi $30
j_33:
sw $31, 4($0)
nop
next_33:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
jal j_34
lw $31,0($0)
j_34:
beq $30, $31, next_34
nop
next_34:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
jal j_35
lw $31,0($0)
j_35:
addu $1, $30, $31
nop
next_35:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
jal j_36
lw $31,0($0)
mfhi $30
j_36:
sw $31, 4($0)
nop
next_36:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
subu $31, $29, $28
lui $31, 0x1234
mfhi $30
j_37:
beq $30, $31, next_37
nop
next_37:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
subu $31, $29, $28
lui $31, 0x1234
mfhi $30
j_38:
addu $1, $30, $31
nop
next_38:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
subu $31, $29, $28
lui $31, 0x1234
j_39:
sw $31, 4($0)
nop
next_39:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
subu $31, $29, $28
addu $30, $28, $29
mflo $30
j_40:
beq $30, $31, next_40
nop
next_40:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
subu $31, $29, $28
addu $30, $28, $29
mfhi $30
j_41:
addu $1, $30, $31
nop
next_41:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
subu $31, $29, $28
addu $30, $28, $29
j_42:
sw $31, 4($0)
nop
next_42:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
subu $31, $29, $28
lw $31,0($0)
j_43:
beq $30, $31, next_43
nop
next_43:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
subu $31, $29, $28
lw $31,0($0)
j_44:
addu $1, $30, $31
nop
next_44:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
subu $31, $29, $28
lw $31,0($0)
mfhi $30
j_45:
sw $31, 4($0)
nop
next_45:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
lw $31,0($0)
lui $31, 0x1234
j_46:
beq $30, $31, next_46
nop
next_46:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
lw $31,0($0)
lui $31, 0x1234
mflo $30
j_47:
addu $1, $30, $31
nop
next_47:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
lw $31,0($0)
lui $31, 0x1234
j_48:
sw $31, 4($0)
nop
next_48:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
lw $31,0($0)
addu $30, $28, $29
j_49:
beq $30, $31, next_49
nop
next_49:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
lw $31,0($0)
addu $30, $28, $29
j_50:
addu $1, $30, $31
nop
next_50:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
lw $31,0($0)
addu $30, $28, $29
mflo $30
j_51:
sw $31, 4($0)
nop
next_51:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
lw $31,0($0)
lw $31,0($0)
mfhi $30
j_52:
beq $30, $31, next_52
nop
next_52:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
addu $30, $28, $29
lw $31,0($0)
lw $31,0($0)
j_53:
addu $1, $30, $31
nop
next_53:
nop
nop
nop
nop
nop
mult $28, $29
addu $30, $28, $29
lw $31,0($0)
lw $31,0($0)
j_54:
sw $31, 4($0)
nop
next_54:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
jal j_55
lui $31, 0x1234
j_55:
beq $30, $31, next_55
nop
next_55:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
jal j_56
lui $31, 0x1234
mflo $30
j_56:
addu $1, $30, $31
nop
next_56:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
jal j_57
lui $31, 0x1234
mflo $30
j_57:
sw $31, 4($0)
nop
next_57:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
jal j_58
addu $30, $28, $29
mflo $30
j_58:
beq $30, $31, next_58
nop
next_58:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
jal j_59
addu $30, $28, $29
mfhi $30
j_59:
addu $1, $30, $31
nop
next_59:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
jal j_60
addu $30, $28, $29
j_60:
sw $31, 4($0)
nop
next_60:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
jal j_61
lw $31,0($0)
j_61:
beq $30, $31, next_61
nop
next_61:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
jal j_62
lw $31,0($0)
j_62:
addu $1, $30, $31
nop
next_62:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
jal j_63
lw $31,0($0)
j_63:
sw $31, 4($0)
nop
next_63:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
subu $31, $29, $28
lui $31, 0x1234
mfhi $30
j_64:
beq $30, $31, next_64
nop
next_64:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
subu $31, $29, $28
lui $31, 0x1234
j_65:
addu $1, $30, $31
nop
next_65:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
subu $31, $29, $28
lui $31, 0x1234
j_66:
sw $31, 4($0)
nop
next_66:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
subu $31, $29, $28
addu $30, $28, $29
j_67:
beq $30, $31, next_67
nop
next_67:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
subu $31, $29, $28
addu $30, $28, $29
mflo $30
j_68:
addu $1, $30, $31
nop
next_68:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
subu $31, $29, $28
addu $30, $28, $29
j_69:
sw $31, 4($0)
nop
next_69:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
subu $31, $29, $28
lw $31,0($0)
j_70:
beq $30, $31, next_70
nop
next_70:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
subu $31, $29, $28
lw $31,0($0)
j_71:
addu $1, $30, $31
nop
next_71:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
subu $31, $29, $28
lw $31,0($0)
mfhi $30
j_72:
sw $31, 4($0)
nop
next_72:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
lw $31,0($0)
lui $31, 0x1234
j_73:
beq $30, $31, next_73
nop
next_73:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
lw $31,0($0)
lui $31, 0x1234
mfhi $30
j_74:
addu $1, $30, $31
nop
next_74:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
lw $31,0($0)
lui $31, 0x1234
mfhi $30
j_75:
sw $31, 4($0)
nop
next_75:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
lw $31,0($0)
addu $30, $28, $29
j_76:
beq $30, $31, next_76
nop
next_76:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
lw $31,0($0)
addu $30, $28, $29
mflo $30
j_77:
addu $1, $30, $31
nop
next_77:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
lw $31,0($0)
addu $30, $28, $29
mfhi $30
j_78:
sw $31, 4($0)
nop
next_78:
nop
nop
nop
nop
nop
mult $28, $29
lw $30,0($0)
lw $31,0($0)
lw $31,0($0)
mflo $30
j_79:
beq $30, $31, next_79
nop
next_79:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
lw $31,0($0)
lw $31,0($0)
mflo $30
j_80:
addu $1, $30, $31
nop
next_80:
nop
nop
nop
nop
nop
mtlo $28
mthi $29
lw $30,0($0)
lw $31,0($0)
lw $31,0($0)
mfhi $30
j_81:
sw $31, 4($0)
nop
next_81:
nop
nop
nop
nop
nop
