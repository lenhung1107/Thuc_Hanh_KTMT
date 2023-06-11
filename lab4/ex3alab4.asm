
.text
li $s1,8
li $s2, 5
start:
slt $t1,$s2,$s1 # s2 < s1
beq $t1,$0,else
add $t3,$s2,$0 # n?u s1>s2 thì th?c hi?n l?nh này
j endif
else:
add $t2,$s1,$zero #th?c hi?n l?nh n?u s2=> s1
endif: 



