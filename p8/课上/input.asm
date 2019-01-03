.text
li $s0, 0x7f40
li $s1, 0x7f2c
li $s2, 0x7f38
li $s3, 0x7f10

loop:
	lw $t0, 0($s0)
	andi $t0, $t0, 0x1
	beq $t0, $0, if_1_end
	nop
		lw $t0, 0($s1)
		sw $t0, 0($s2)

		addu $s4, $t0, $0
		
		li $s5, 0
		for_1_begin:
		li $t0, 8
		beq $s5, $t0, for_1_end
		nop
			andi $t0, $s4, 0xf
			srl $s4, $s4, 4
			
			sltiu $t1, $t0, 10
			
			beq $t1, $0, if_4_else
			nop
				addiu $s6, $t0, 48
			j if_4_end
			nop
			if_4_else:
				addiu $s6, $t0, 55
			if_4_end:
			
			while_1_begin:
				lw $t1, 16($s3)
				andi $t1, $t1, 0x20
				beq $t1, $0, if_2_end
				nop
					sw $s6, 0($s3)
					j while_1_end
					nop
				if_2_end:
				j while_1_begin
				nop
			while_1_end:
		
		addiu $s5, $s5,1
		j for_1_begin
		nop
		for_1_end:

		while_no_begin:
			lw $t0, 0($s0)
			andi $t0, $t0, 0x1
			bne $t0, $0, if_3_end
			nop
				j while_no_end
				nop
			if_3_end:
			j while_no_begin
			nop	
		while_no_end:
		
	if_1_end:
j loop
nop
