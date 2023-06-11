.data
string: .space 21
x: .space 21
Message1: .asciiz "Nhap xau:”
Message2: .asciiz "Xau dao nguoc la "
.text
main:
get_string: 
li $v0,4
la $a0,Message1
syscall 
li $v0,8
la $a0,string
la $a1,50
syscall 
get_length: 
la $a0, string # a0 = Address(string[0])
 xor $s0, $zero, $zero # v0 = length = 0
 xor $t0, $zero, $zero # t0 = i = 0
check_char: 
add $t1, $a0, $s0 # t1 = a0 + t0 
 #= Address(string[0]+i) 
 lb $t2, 0($t1) # t2 = string[i]
 beq $t2,$zero,end_of_str # Is null char? 
 addi $s0, $s0, 1 # v0=v0+1->length=length+1
 addi $t0, $t0, 1 # t0=t0+1->i = i + 1
 j check_char
end_of_str: 
end_of_get_length:

check_print:
addi $t4,$s0,-1 # lay phan tu cuo cung cua chuoi de kiem tra
add $s5,$a0,$t4 # dia chi thu y[0]+i
lb  $t5,0($s5) # t5= value(y[0]+i)
li $s6,'\n' # gan gia tri s6 = ki tu xuong dong
bne $t5,$s6,reverse # kiem tra neu khong la phan tu /n thi thuc hien rev
addi $s0,$s0,-1 #n?u là '\0' ta tính length = length tr? 1 b? qua '\n' ?? ?i ??o chu?i 

reverse:
          la    $a1, x       # l?y ??a ch? c?a msg_rev
          addi  $s0, $s0, -1       # length of string = length -1
          li    $v1, 0             # v1 = i = 0
loop: 
          addi  $t3, $s0, 1     
          beq   $t3, $zero, end_of_rev  # ki?m tra xem 
          add   $t1, $a0, $s0      #  l?y ??a ch? c?a string[0]
          lb    $t2,  0($t1)       #  l?y giá tr? t? ??a ch? string[0]      
          add   $t3, $a1, $v1      #  l?y ??a ch? x[0] + i
          sb    $t2, 0($t3)        #  gán giá tr? x[i]
          addi  $v1, $v1,1         #  i=i+1
          addi  $s0, $s0, -1       #  length = length - 1
          j     loop                
end_of_rev:  

print_length: 
li $v0,4
la $a0,Message2
syscall 
li $v0,4
la $a0,x
syscall 
