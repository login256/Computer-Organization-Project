.text
li $s0, 0x7f40	#button
li $s1, 0x7f2c	#switch
li $s2, 0x7f38	#tube

loop:
	#save
	lw $t0, 0($s0)
	andi $t0, $t0, 0x1
	beq $t0, $0, if_save_end
	nop
		lw $t0, 0($s1)
		lw $t1, 4($s1)
		
		sltiu $t2, $t1, 0x2000
		
		andi $t3, $t1, 0x3
		sltu $t3, $0, $t3
		li $t4, 1
		subu $t3, $t4, $t3	#t1[1:0]==0

		and $t2, $t2, $t3

		bne $t2, $0, if_1_else
		nop
			li $t2, -1
			sw $t2, 0($s2)
		j if_1_end
		nop
		if_1_else:
			sw $t0, 0($t1)
			sw $t0, 0($s2)
		if_1_end:

		while_nosave_begin:
			lw $t0, 0($s0)
			andi $t0, $t0, 0x1
			bne $t0, $0, if_nosave_end
			nop
				j while_nosave_end
				nop
			if_nosave_end:

			j while_nosave_begin
			nop
		while_nosave_end:

	if_save_end:

	#load
	lw $t0, 0($s0)
	andi $t0, $t0, 0x2
	beq $t0, $0, if_load_end
	nop
		lw $t1, 4($s1)
		
		sltiu $t2, $t1, 0x2000
		
		andi $t3, $t1, 0x3
		sltu $t3, $0, $t3
		li $t4, 1
		subu $t3, $t4, $t3	#t1[1:0]==0

		and $t2, $t2, $t3

		bne $t2, $0, if_2_else
		nop
			li $t2, -1
			sw $t2, 0($s2)
		j if_2_end
		nop
		if_2_else:
			lw $t0, 0($t1)
			sw $t0, 0($s2)
		if_2_end:

		while_noload_begin:
			lw $t0, 0($s0)
			andi $t0, $t0, 0x2
			bne $t0, $0, if_noload_end
			nop
				j while_noload_end
				nop
			if_noload_end:

			j while_noload_begin
			nop
		while_noload_end:

	if_load_end:

j loop
nop
