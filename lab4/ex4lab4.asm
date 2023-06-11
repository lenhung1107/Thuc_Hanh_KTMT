#Laboratory Exercise 4, Home Assignment 4
.text
start: 
li $s1,0x7FFFFFFF
li $s2, 3
li $t0,0   #No Overflow is default status
addu $s3,$s1,$s2 # s3 = s1 + s2
xor $t1,$s1,$s2 #Test if$s1and$s2have the same sign
bltz $t1,EXIT # neu s1, s2 khau dau thi exit
xor $t2,$s3,$s1 # so sanh tong voi so hang s1, neu cung dau thi tra ve t2 >0

bltz $t2,OVERFLOW # neu tong khac dau s1 thì tran so 
j EXIT

OVERFLOW:li $t0,1#the result is overflow
EXIT: