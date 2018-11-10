.text
addi $v0, $0, 5
syscall
add $s0, $v0, $0
li $s1, 1
andi $t0, $s0, 3
beq $t0, $0, end_if_1
nop
li $s1, 0
end_if_1:
li $t0 100
div $s0, $t0
mfhi $t1
bgtz $t1 end_if_2
nop
li $t0 400
div $s0, $t0
mfhi $t1
beqz $t1, end_if_3
nop
li $s1, 0
end_if_3:
end_if_2:
add $a0, $0, $s1
addi $v0, $0, 1
syscall
li $v0,10
syscall