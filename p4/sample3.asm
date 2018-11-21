# addu subu ori lw sw beq lui jal jr nop
.data
	my_stack: .space 200
.text
	ori $s0,4
	ori $s1,10
	ori $s2,1
	addu $a0,$0,$s1
	jal func
	jal end
	
func:
	sw $ra,0($t1)
	addu $t1,$t1,$s0
	
	beq $a0,$s2,func_ret
		sw $a0,0($t1)
		addu $t1,$t1,$s0
		
		subu $a0,$a0,$s2
		jal func
		
		subu $t1,$t1,$s0
		lw $a0,0($t1)
		addu $v0,$v0,$a0
		
		jal func_end

func_ret:
	addu $v0,$0,$s2
	j func_end

func_end:
	subu $t1,$t1,$s0
	lw $ra,0($t1)
	jr $ra


end:
	lui $t7,16
