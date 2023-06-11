.data
string: .space 21
x: .space 21
Message1: .asciiz "Nhap xau: "
Message2: .asciiz "Xau dao nguoc la: "

.text
main:
get_string: 
li $v0,4
la $a0, Message1
syscall 

li $v0, 8
 la $a0, string
 la $a2, 50
 syscall 
 
get_length: 
la $a0, string # a0 = Address(string[0])
 xor $s0, $zero, $zero # v0 = length = 0
 xor $t0, $zero, $zero # t0 = i = 0
check_char:
 add $t1, $a0, $t0 # t1 = a0 + t0 
 #= Address(string[0]+i) 
 lb $t2, 0($t1) # t2 = string[i]
 beq $t2,$zero,end_of_str # Is null char? 
 addi $s0, $s0, 1 # v0=v0+1->length=length+1
 addi $t0, $t0, 1 # t0=t0+1->i = i + 1
 j check_char
end_of_str: 
end_of_get_length:

check_new_line: 
addi $t4, $s0, -1       # l?y v? trí vi th?  i = length - 1 ?? ki?m tra xem ký t? cu?i có ph?i là ký t? xuón
add  $s1, $a0, $t4      # ??a ch? c?a string[0] + i
lb   $t5, 0($s1)        # l?y giá tr? t? ??a ch? (string[0] + i)
li   $t8, '\n'          # gán giá tr? thanh ghi $t8 = '\n'
bne  $t5, $t8, rev   # ki?m tra xem giá tr? string[0] + i có ph?i là '\n' không
add  $s0, $s0, -1       # n?u là '\0' ta tính length = length tr? 1 b? qua '\n' ?? ?i ??o chu?i 
rev:
la $a1,x
addi $s0,$s0,-1 #do dai string
li $v1,0 # i=0

i1:
addi $t3,$s0,1
beq   $t3, $zero, end_of_strcpy  # ki?m tra xem 
add $t1,$a0,$s0 #t1 = s0 + a1 = i + y[n]
 # = address of y[i]
lb $t2,0($t1) #t2 = value at t1 = y[i]
add $t3,$a1,$v1 #t3 = s0 + a0 = i + x[0] 
 # = addressof x[i]
sb $t2,0($t3) #x[i]= t2 = y[i]
addi $v1,$v1,1 #i=i+1
addi $s0,$s0,-1 # length --
j i1 #next character
end_of_strcpy:

print_length: 
li $v0,4
la $a0,Message2
syscall 

li $v0,4
la $a0,x
syscall 