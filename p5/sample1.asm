jal init	#init()
nop

ori $s0, $0, 1
ori $s1, $0, 1024
for_1_begin:
beq $s0, $s1, for_1_end #for i = 1 to 1024
nop

	sll $s2, $s0, 2
	
    lw $t0, -4($s2) #get a[i-1]
    ori $t1, $0, 0x8000     #try zero extern (16'b1000...)
    subu $t0, $t0, $t1
    sw $t0, 0($s2)      #a[i]=a[i-1]-0x8000     // can less than 0

ori $t0, $0, 1
addu $s0, $s0, $t0
j for_1_begin
nop
for_1_end:

jal end	#end of program
nop
init:	#void init()

	ori $t0, $0, 0x7111 #to try the lui     //lui is {imm,{16{0}}}, not {imm, $rs}
	lui $t0, 0x00ff
	ori $t0, 0x8000     #0x0ff8000(9 continouns zero begin from 16's bits)

	#sw $t0, 0($0)  #a[0] = 0x00010000
	j init_end
	sw $t0, 0($0)
init_end:
jr $ra
nop

end:
