.data
A: .word 4, 3, 2, 1
Aend: .word 
out1: .asciiz " "

.text
main: la $a0,A #$a0 dia chi phan tu A[0]
la $a1,Aend # dia chi phan tu sau phan tu cuo cua mang A
 addi $a1,$a1,-4 #$a1 dia chi phan tu cuoi mang a
 j sort #sort
after_sort: li $v0, 10 #exit
 syscall
end_main:

sort: beq $a0,$a1,done #thoat chuong trinh 
 j max # goi den ham max
after_max: lw $t0,0($a1) #load last element into $t0
 sw $t0,0($v0) #copy last element to max location
 sw $v1,0($a1) #copy max value to last element
 addi $a1,$a1,-4 #decrement pointer to last element
 j sort #repeat sort for smaller list
done: j print

max:
addi $v0,$a0,0 # gan v0 la con tro tro den phan tu dau
lw $v1,0($v0) #gan gia tri cua phan tu dau vao v1
addi $t0,$a0,0 # t0 laf con tro tro den phan tu tiep 
loop:
beq $t0,$a1,ret # neu con tro tiep tro den phan tu cuoi cung thi goi den ham ret
addi $t0,$t0,4 #advance to next element
lw $t1,0($t0) #load next element into $t1
slt $t2,$t1,$v1 #(next)<(max) ?
bne $t2,$zero,loop #if (next)<(max), repeat
addi $v0,$t0,0 #next element is new max element
addi $v1,$t1,0 #next value is new max value
j loop #change completed; now repeat
ret:
j after_max

print:
li $s1,-1 # i=1
la $s2,A #gan bang dia chi phan tu A[0]
li $s3,3
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