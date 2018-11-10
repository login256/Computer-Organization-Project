ori $s1, $0, 32

ori $s2, $0, 0

ori $s0, $0, 0
for_1_begin:
beq $s0, $s1, for_1_end

	
	sw $s0, 0($s2)
	
	ori $t0, $0, 4
	addu $s2, $s2, $t0

ori $t0, $0, 1
addu $s0, $s0, $t0
beq $0, $0, for_1_begin
for_1_end:
nop
