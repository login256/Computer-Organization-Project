.data
graph: .space 400
vis: .space 400
N: .space 4
M: .space 4
.text

li $v0, 5
syscall
add $s0, $v0, $0	#read n

la $t0, N
sw $s0, 0($t0)	#store n

li $v0, 5
syscall
add $s1, $v0, $0	#read m

la $t0, M
sw $s1, 0($t0)	#store m

li $s2, 1	#i
for_1_begin:
slt $t0, $s0, $s2
bne $t0, $0, for_1_end	#for i = 1 to n
	
	li $s3, 1	#j
	for_2_begin:
	slt $t0, $s1, $s3
	bne $t0, $0, for_2_end	#for j = 1 to m
		
		addi $t0, $s1, 2
		mult $s2, $t0
		mflo $t0,
		add $t0, $t0, $s3
		sll $t0, $t0, 2
		la $t1, graph
		add $t1, $t0, $t1	#graph+i*(m+2)+j
		la $t2, vis
		add $t2, $t0, $t2
		
		li $v0, 5
		syscall
		sw $v0, 0($t1)	#read graph[i][j]
		
		sw $0, 0($t2)	#vis[i][j]=0
		
	addi $s3, $s3, 1
	j for_2_begin
	for_2_end:
	
addi $s2, $s2, 1
j for_1_begin
for_1_end:

la $s3, graph	#graph

la $s4, graph
addi $t0, $s1, 1
sll $t0, $t0, 2
add $s4, $s4, $t0	#graph+m+1

li $s2, 1
for_3_begin:
slt $t0, $s0, $s2
bne $t0, $0, for_3_end	#for i = 1 to n
	
	addi $t0, $s1, 2
	sll $t0, $t0, 2
	add $s3, $s3, $t0	#graph + i*(m+2)
	add $s4, $s4, $t0	#graph + m+1 + i*(m+2)
	
	li $t0, 1
	sw $t0, 0($s3)	#graph[i][0]=1
	sw $t0, 0($s4)	#graph[i][m+1]=1
	
addi $s2, $s2, 1
j for_3_begin
for_3_end:


la $s3, graph	#graph

la $s4, graph
addi $t0, $s1, 2
addi $t1, $s0, 1
mult $t0, $t1
mflo $t0	#(n+1)*(m+2)
sll $t0, $t0, 2
add $s4, $s4, $t0	#graph+m+1

li $s2, 1
for_4_begin:
slt $t0, $s1, $s2
bne $t0, $0, for_4_end	#for i = 1 to m
	
	addi $s3, $s3, 4	#graph + i
	addi $s4, $s4, 4	#graph + (n+1)*(m+2) + i
	
	li $t0, 1
	sw $t0, 0($s3)	#graph[0][i]=1
	sw $t0, 0($s4)	#graph[n+1][i]=1
	
addi $s2, $s2, 1
j for_4_begin
for_4_end:

li $v0, 5
syscall
add $s2, $v0, 0	#read sx

li $v0, 5
syscall
add $s3, $v0, 0	#read sy

li $v0, 5
syscall
add $s4 $v0, 0	#read tx

li $v0, 5
syscall
add $s5, $v0, 0	#read ty

add $a0, $s2, 0
add $a1, $s3, 0
add $a2, $s4, 0
add $a3, $s5, 0
jal dfs	#dfs(sx,xy,tx,ty)

add $a0, $v0, $0
li $v0, 1
syscall	#print dfs()

li $v0, 10
syscall	#########end

dfs:	#int dfs(x,y,tx,ty)
sw $ra, 0($sp)
addi $sp, $sp, -4
sw $s0, 0($sp)
addi $sp, $sp, -4
sw $s1, 0($sp)
addi $sp, $sp, -4
sw $s2, 0($sp)
addi $sp, $sp, -4
sw $s3, 0($sp)
addi $sp, $sp, -4
sw $s4, 0($sp)
addi $sp, $sp, -4
sw $s5, 0($sp)
addi $sp, $sp, -4
	
add $s0, $a0, $0
add $s1, $a1, $0
add $s2, $a2, $0
add $s3, $a3, $0
	 
	seq $t0, $s0, $s2
	seq $t1, $s1, $s3
	and $t0, $t0, $t1
	beq $t0, $0, if_1_end	#if x==tx&&y==ty
		li $v0, 1
		j dfs_end
	if_1_end:
	
	la $t0, M
	lw $t0, 0($t0)	#get m
	
	addi $t1, $t0, 2
	mult $s0, $t1
	mflo $t1
	add $t1, $t1, $s1
	sll $t1, $t1, 2	#(x*(m+2)+y)*4
	
	la $t2, graph
	add $t2, $t1, $t2
	lw $t2, 0($t2)	#graph[x][y]
	
	la $t3, vis
	add $s4, $t1, $t3	#&(vis[x][y])
	lw $t3, 0($s4)	#vis[x][y]
	
	or $t2, $t2, $t3
	beq $t2, $0, if_2_end	#if graph[x][y]||vis[x][y]
		li $v0, 0
		j dfs_end
	if_2_end:
	
	li $t2, 1
	sw $t2, 0($s4)	#vis[x][y]=1
	
	li $s5, 0	#cnt
	
	addi $a0, $s0, 1
	addi $a1, $s1, 0
	add $a2, $s2, $0
	add $a3, $s3, $0
	jal dfs
	add $s5, $s5, $v0	#dfs(x+1,y,tx,ty)
	
	addi $a0, $s0, 0
	addi $a1, $s1, 1
	add $a2, $s2, $0
	add $a3, $s3, $0
	jal dfs
	add $s5, $s5, $v0	#dfs(x,y+1,tx,ty)
	
	
	addi $a0, $s0, -1
	addi $a1, $s1, 0
	add $a2, $s2, $0
	add $a3, $s3, $0
	jal dfs
	add $s5, $s5, $v0	#dfs(x-1,y,tx,ty)
	
	addi $a0, $s0, 0
	addi $a1, $s1, -1
	add $a2, $s2, $0
	add $a3, $s3, $0
	jal dfs
	add $s5, $s5, $v0	#dfs(x,y-1,tx,ty)
	
	li $t2, 0
	sw $t2, 0($s4)	#vis[x][y]=0
	
	add $v0, $s5, $0
	
dfs_end:
addi $sp, $sp, 4
lw $s5, 0($sp)
addi $sp, $sp, 4
lw $s4, 0($sp)
addi $sp, $sp, 4
lw $s3, 0($sp)
addi $sp, $sp, 4
lw $s2, 0($sp)
addi $sp, $sp, 4
lw $s1, 0($sp)
addi $sp, $sp, 4
lw $s0, 0($sp)
addi $sp, $sp, 4
lw $ra, 0($sp)
jr $ra