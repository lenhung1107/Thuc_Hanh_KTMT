.data 
out: .asciiz " The sum of  "
and: .asciiz " and "
is: .asciiz " is " 
.text
li $s0,4
li $s1, 3

li $v0, 4
la $a0,out
syscall 

li $v0, 1
add $a0,$0,$s0
syscall 

li $v0, 4
la $a0,and 
syscall 

li $v0, 1
add $a0,$0,$s1
syscall 

li $v0, 4
la $a0,is
syscall 

li $v0,1
add $a0,$s1,$s0
syscall 
