#Laboratory Exercise 4, Home Assignment 1
.text
start: 
li $s1,0x7FFFFFFF
li $s2, 3
li $t0,0   #No Overflow is default status
addu $s3,$s1,$s2 # s3 = s1 + s2
xor $t1,$s1,$s2#Test if$s1and$s2have the same sign
bltz $t1,EXIT #If not, exit
slt $t2,$s3,$s1
bltz $s1,NEGATIVE#Test if$s1and$s2is negative?
beq $t2,$zero,EXIT #s1 and$s2are positive # if$s3>$s1then the result is not overflow
j OVERFLOW
NEGATIVE:
bne $t2,$zero,EXIT#s1 and$s2are negative
# if$s3<$s1then the result is not overflow
OVERFLOW:li $t0,1#the result is overflow
EXIT: