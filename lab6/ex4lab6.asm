.data
A: .word 1, 4, 2, 3, -1, 9, -5
out1: .asciiz " "
.text
main: 	
	la $a0,A #$a0 = Address(A[0])
	li $s0,7 # size of A = n -1

insert:
	li $t0,1 # i=1
loop:
	slt $t2,$t0,$s0 # i< n t2=1
	beq $t2,$0,print # neu i >= n thif endfor
	addi $t1,$t0,-1 # j=i-1
	sll $s1,$t0,2 #s1 = 4i
	add $s2,$a0,$s1
	lw $s4,0($s2) # key = a[i]
while:
	slt $s3,$t1,$0 # j < 0 => s3 =1
	bne $s3,$0,endwhile
	sll $t5,$t1,2 # 4j
	add $s3,$a0,$t5
	lw $s5,0($s3) # s5=a[j]
	slt $t7,$s4,$s5 # key < a[j] t7=1
	beq $t7,$0,endwhile # key >= a[j] => endwhile
	sw $s5,4($s3) # a[j]= a[j+1]
	addi $t1,$t1,-1 # j=j-1
	j while
endwhile:
	sll $t5,$t1,2
	add $t6,$a0,$t5
	sw $s4,4($t6) #key= a[j+1]
	addi $t0,$t0,1 # i=i+1
	j loop
endFor:	
print:
li $s1,-1 # i=1
la $s2,A #gan bang dia chi phan tu A[0]
li $s3,6
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

