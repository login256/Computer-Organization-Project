.text
li $s0, 0x7f34
li $s1, 0
li $s2, -1

for_1_begin:
beq $s1, $s2, for_1_end
nop
	nor $t0, $s1, $0
	sw $t0, 0($s0)
	addiu $s1, $s1, 1
j for_1_begin
nop
for_1_end:
