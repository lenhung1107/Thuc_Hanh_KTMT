#Laboratory Exercise 7 Home Assignment 5 
.data
print1: .asciiz "Gia tri lon nhat trong cac phan tu la : "
andd: .asciiz " luu tai thanh ghi $s"
print2: .asciiz "gia tri nho nhat trong cac phan tu la: "
enter: .asciiz "\n"
.text
		li $s0, 2 
		li $s1, 0
		li $s2, 1
		li $s3, -9
		li $s4, 6
		li $s5, -5
		li $s6, 0
		li $s7, 8
		
		li $t3, 8 #index dung  trong max
		li $t4, 8 # index dung trong minA
main: 	jal push
	nop
	jal max
	nop
	jal min 
	nop
print_max:		li $v0, 4 
		la $a0, print1
		syscall
		li $v0, 1
		add $a0, $zero, $a1 # $a1 luu tru gia tri max
		syscall
		li $v0, 4
		la $a0, andd
		syscall
		li $v0, 1
		add $a0, $zero, $t1 # $t1 -> thanh ghi luu tru gia tri cua thanh ghi luu gia tri max
		syscall
		li $v0, 4
		la $a0, enter
		syscall
print_min:	li $v0, 4
		la $a0, print2
		syscall
		li $v0, 1
		add $a0, $zero, $a2 # a2 luu tru gia tri min
		syscall
		li $v0, 4
		la $a0, andd
		syscall
		li $v0, 1
		add $a0, $0, $t2  # t2 luu tru gia tri thanh gia chua gtri min
		syscall
exit: 	li $v0, 10
	syscall
end_main:
#-----------------------------------
push: 	addi $sp, $sp, -32 # tao khoang trong stack de luu tru 8 gia tri
	sw $s0, 28($sp)
	sw $s1, 24($sp)
	sw $s2, 20($sp)
	sw $s3, 16($sp)
	sw $s4, 12($sp)
	sw $s5, 8($sp)
	sw $s6, 4($sp)
	sw $s7, 0($sp)
push_end:	jr $ra
#----------------------------------------------
max: 	lw $v1, 0($sp)	# pop phan tu dau tien vao $v1
	addi $sp, $sp, 4
	addi $t3, $t3,-1  # chi so giam 1 sau moi lan lap 
	
	beq $t3, 0, end1 # kiem tra xem da den phan tu cuoi hay chua
	slt $t0, $v1, $a1 #v1 < max hi?n t?i 
	bne $t0, $zero, max 
	add $t1, $zero, $t3 #luu index cua max
	add $a1, $zero, $v1 #luu max vao tu $v1 sang $t5
	j max
end1:	add $sp, $sp, -32 #adjust stack pointer to the top of stack
		jr $ra
#----------------------------------------------
min: 	lw $v1, 0($sp)	#pop tu stack
	addi $sp, $sp, 4
	addi $t4, $t4, -1 

	beq $t4, 0, end2 # khi stack rong -> end
	slt $t0, $a2, $v1 # so sanh $1 dang chua min hien tai voi $t0 la ptu hien tai
	bne $t0, $zero, min 
	add $t2, $zero, $t4 # luu index cua min
	add $a2, $zero, $v1 # luu gia tri min
	j min
end2:	add $sp, $sp, -32 #adjust stack pointer to the top of stack 
		jr $ra