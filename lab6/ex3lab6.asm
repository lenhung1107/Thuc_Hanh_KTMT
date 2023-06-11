.data
A: .word 1,4,2,3,-1,9,-5
Aend: .word 
out1: .asciiz " "
.text
main: 	
	la $a0,A #$a0 = Address(A[0])
	li $s0,6 # size of A = n
	li $t0,0 # i=0

BubbleSort:
for1:
	slt $t2,$t0,$s0 # i < n-1  t2 =1
	beq $t2,$0,print
	sub $s1,$s0,$t0 # s1=n-i-1
	li $t1,0 # j=0
for2:
	slt $s2,$t1,$s1 # j < n-i-1 => s2=1
	beq $s2,$0,endloop2
	
	sll $t4,$t1,2 # $t4=4j
	add $t5,$a0,$t4
	lw $t6,0($t5) #a[j]
	lw $t7,4($t5) #a[j+1]
	slt $s5,$t7,$t6 # a[j+1] < a[j] s5=1
	bne $s5,$0,swap 
	j nextj
swap:
	sw $t6,4($t5)
	sw $t7,0($t5)
nextj:
	addi $t1,$t1,1 # j=j+1
	j for2
endloop2:
	addi $t0,$t0,1 # i=i+1
	j  for1

print:
li $s1,-1 # i=1
la $s2,A #gan bang dia chi phan tu A[0]
li $s3,7
li $s4,1 # step
oop:
add $s1,$s1,$s4 #i=i+step
add $t1,$s1,$s1 #t1=2*s1
add $t1,$t1,$t1 #t1=4*s1
add $t1,$t1,$s2 #t1 store the address of A[i]
lw $t0,0($t1) #load value of A[i] in $t0
li $v0, 1 # service 1 is print integer
add $a0,$t0,$0
 syscall 
 li $v0, 4 # service 1 is print integer
 la $a0,out1
 syscall 
bne $s1,$s3,oop #if i != n, goto loop

