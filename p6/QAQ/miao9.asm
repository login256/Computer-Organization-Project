#the first part is about the cal_r stall:all about load instruction will cause the stall.
ori $1,$0,-100
lui $2,100
add $1,$2,$1
sw $1,0($0)
lw $2,0($0)
addu $3,$2,$0#lw-addu-rs:stall
lw $3,0($0)
subu $4,$0,$3#lw-subu-rt:stall
lh $4,0($0)
add $5,$4,$0#lh-add-rs:stall
lhu $5,2($0)
sub $6,$0,$5#lhu-sub-rt:stall
lb $6,0($0)
and $7,$6,$3#lb-and-rs:stall
lb $7,1($0)
or $8,$2,$7#lb-or-rt:stall
lbu $8,2($0)
xor $9,$8,$1#lbu-xor-rs:stall
lbu $9,3($0)
nor $10,$1,$9#lbu-nor-rt:stall
lbu $11,3($0)
slt $12,$11,$9#lbu-slt-rs:stall
lhu $13,0($0)
sltu $14,$12,$13#lhu-sltu-rt:stall
#the next part is about the forward function:all about the load-x-cal_r,cal_i-cal_r,shift-cal_r,jumpandlink-cal_r,mfhi/lo-cal_r
ori $1,$0,300
add $2,$1,$1#ori-add-rs,rt:forward
slt $3,$1,$2#add-slt-rt:forward
sltu $4,$3,$0#slt-sltu-rs:forward
ori $5,$0,-80
slt $6,$5,$0#ori-slt-rs:forward
ori $7,$0,-100
sltu $8,$7,$5#ori-sltu-rt:forward
slt $8,$7,$5
or $9,$7,$6
xor $10,$9,$9#or-xor-rs,rt:forward
nor $11,$10,$9#xor-nor-rs:forward
and $12,$11,$1#nor-and-rs:forward
sll $13,$7,5
or $14,$13,$0#sll-or-rs:forward
srl $15,$7,5
or $16,$0,$15#srl-or-rt:forward
sra $17,$5,5
or $18,$17,$0#sra-or-rs:forward
ori $19,$0,7
sllv $20,$5,$19
or $21,$20,$0#sllv-or-rs:forward
srlv $22,$5,$19
or $23,$22,$19#srlv-or-rs:forward
srav $24,$5,$19
or $25,$24,$0#srav-or-rs:forward
jal next
nop
mult:ori $1,$0,100
ori $2,$0,-100
mult $1,$2
mflo $3
add $3,$3,$5
jr $5
next:addu $31,$31,$0#jal-nop-addu-rs:forward
sltu $30,$31,$0
jalr $5,$31
nop
end:
exit:	j exit
	nop