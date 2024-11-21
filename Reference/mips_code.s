.data
global: .word 0
.text
.globl main

# Program entry
j main

fun:
	 li $t0, 4
	 sub $sp, $sp, $t0
	 move $t2, $sp
	 li $t3,4
	 sub $t2,$t2,$t3
	 # LOADING ..
	 add $t9,$sp,0
	 lw $t4, 0($t9)
	 sw $t4,0($t2)

	 li $t1, 10
	 li $t3,4
	 sub $t2,$t2,$t3
	 sw $t1,0($t2)

	 # ADDING ..
	 lw $t1,0($t2)
	 lw $t0,4($t2)
	 li $t3,4
	 add $t2,$t2,$t3
	# *
	 mul $t1,$t0,$t1
	 sw $t1,0($t2)

	lw $v0,0($t2)
	 add $sp, $sp, 4
	 move $t2, $sp
	 jr $ra
	 li $t0, 4
	 add $sp, $sp, $t0
	 move $t2, $sp
	 jr $ra

main:
	la $ra, exit
	 li $t0, 8
	 sub $sp, $sp, $t0
	 move $t2, $sp
	 li $v0,5
	 syscall
	 # STORING ..
	 add $t9,$sp,0
	 sw $v0, 0($t9)
	 li $t3,4
	 sub $t2,$t2,$t3
	 # LOADING ..
	 add $t9,$sp,0
	 lw $t4, 0($t9)
	 sw $t4,0($t2)

	move $t0,$sp
	li $t1, 20
	sub $t0,$t0,$t1
	lw $t4,0($t2)
	sw $t4,0($t0)
	li $t0,4
	sub $sp,$sp,$t0
	sw $ra,0($sp)
	move $t2,$sp
	li $t0,12
	sub $sp,$sp,$t0
	jal fun

	add $sp,$sp,12
	lw $ra,0($sp)
	add $sp,$sp,4
	move $t2,$sp
	li $t0,4
	sub $t2,$t2,$t0
	sw $v0,0($t2)
	 lw $t1,0($t2)
	 # STORING ..
	 add $t9,$sp,4
	 sw $t1, 0($t9)
	 add $t2,$t2,4
	 # LOADING ..
	 add $t9,$sp,4
	 lw $a0, 0($t9)
	 li $v0,1
	 syscall
	 li $a0,32
	 li $v0,11
	 syscall
	 li $t0, 8
	 add $sp, $sp, $t0
	 move $t2, $sp
	 jr $ra

exit:
	li $v0, 10
	syscall
