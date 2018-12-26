.ktext 0x00004180
_entry:
	ori	$k0, $0, 0x1000
	sw	$sp, -4($k0)
	mfc0	$k1, $12
	sw	$k1, -8($k0)
	
	addiu	$k0, $k0, -256
	move	$sp, $k0
	
	j	_save_context
	nop
	
_main_handler:

	mfc0 $t0, $13
	li $t1, 0x7c
	and $t0, $t0, $t1
	srl $t0, $t0, 2
	
	bne $t0, $0, handler_if_1_end	#Int
	nop
		
		mfc0 $t1, $13
		andi $t0, $t1, 0x400
		beq $t0, $0, _handler_Int_if_1_end	#if s1[10]!=0 Dev0INT
		nop
			li $t0, 0x7f00
			lw $t1, 0($t0)
			ori $t1, $t1, 0x1
			sw $t1, 0($t0)
			
			li $t0, 0x7f38
			lw $t1, 0($t0)
			addiu $t1, $t1, -1
			sw $t1, 0($t0)

		_handler_Int_if_1_end:

		mfc0 $t1, $13
		andi $t0, $t1, 0x800
		beq $t0, $0, _handler_Int_if_2_end	#if s1[11]!=0 Dev1INT
		nop
			li $s0, 0x7f10
			lw $s1, 0($s0)

			li $t0, 0x7f38
			sw $s1, 0($t0)

			_handler_Int_while_1_begin:
				lw $t0, 4($s0)
				andi $t0, $t0, 0x20
				beq $t0, $0, _handler_Int_2_if_1_end
				nop
					sw $s1, 0($s0)
					j _handler_Int_while_1_end
				_handler_Int_2_if_1_end:
			j _handler_Int_while_1_begin
			nop
			_handler_Int_while_1_end:

		_handler_Int_if_2_end:
		
		li $t1, 0x1000
		lw $t2, -12($t1)
		addiu $t2, $t2, 1
		sw $t2, -12($t1)
		j _restore
		nop
	handler_if_1_end:
	
	li $t1, 0x1000
	lw $t2, -16($t1)
	addiu $t2, $t2, 1
	sw $t2, -16($t1)
	
	mfc0 $k0, $14
	addu $k0, $k0, 4
	mfc0 $t0, $13
	
	srl $t0, $t0, 31
	beq $t0, $0, handler_if_2_end	#if BD!=0
	nop
		addu $k0, $k0, 4
	handler_if_2_end:
	mtc0 $k0, $14
	
	j	_restore
	nop
	
_save_context:
	sw  	$1, 4($sp)
	sw  	$2, 8($sp)    
	sw  	$3, 12($sp)    
   	sw  	$4, 16($sp)    
   	sw  	$5, 20($sp)    
   	sw  	$6, 24($sp)    
   	sw  	$7, 28($sp)    
   	sw  	$8, 32($sp)    
   	sw  	$9, 36($sp)    
   	sw  	$10, 40($sp)    
   	sw  	$11, 44($sp)    
   	sw  	$12, 48($sp)    
   	sw  	$13, 52($sp)    
   	sw  	$14, 56($sp)    
   	sw  	$15, 60($sp)    
   	sw  	$16, 64($sp)    
   	sw  	$17, 68($sp)    
   	sw  	$18, 72($sp)    
   	sw  	$19, 76($sp)    
   	sw  	$20, 80($sp)    
   	sw  	$21, 84($sp)    
   	sw  	$22, 88($sp)    
   	sw  	$23, 92($sp)    
   	sw  	$24, 96($sp)    
   	sw  	$25, 100($sp)    
   	sw  	$26, 104($sp)    
   	sw  	$27, 108($sp)    
   	sw  	$28, 112($sp)    
#  	sw  	$29, 116($sp)    
   	sw  	$30, 120($sp)    
   	sw  	$31, 124($sp)

	mfhi 	$k0
	sw 	$k0, 128($sp)
	mflo 	$k0
	sw 	$k0, 132($sp)
	j	_main_handler
	nop
	


_restore:
	lw 	$1, 4($sp)
   	lw  	$2, 8($sp)    
   	lw  	$3, 12($sp)    
   	lw  	$4, 16($sp)    
   	lw  	$5, 20($sp)    
   	lw  	$6, 24($sp)    
   	lw  	$7, 28($sp)    
   	lw  	$8, 32($sp)    
   	lw  	$9, 36($sp)    
   	lw  	$10, 40($sp)    
   	lw  	$11, 44($sp)    
   	lw  	$12, 48($sp)    
   	lw  	$13, 52($sp)    
   	lw  	$14, 56($sp)    
   	lw  	$15, 60($sp)    
   	lw  	$16, 64($sp)    
   	lw  	$17, 68($sp)    
   	lw  	$18, 72($sp)    
   	lw  	$19, 76($sp)    
   	lw  	$20, 80($sp)    
   	lw  	$21, 84($sp)    
   	lw  	$22, 88($sp)    
   	lw  	$23, 92($sp)    
   	lw  	$24, 96($sp)    
   	lw  	$25, 100($sp)    
   	lw  	$26, 104($sp)    
   	lw  	$27, 108($sp)    
   	lw  	$28, 112($sp)    
#	lw  	$29, 116($sp)    
  	lw  	$30, 120($sp)    
   	lw  	$31, 124($sp)    

	lw 	$k0, 128($sp)
	mthi 	$k0
	lw 	$k0, 132($sp)
	mtlo 	$k0
    
	ori $k0, $0, 0x1000
	lw $sp, -4($k0)
	eret
	mult $2, $3
	mult $3, $4
	mult $5, $5
