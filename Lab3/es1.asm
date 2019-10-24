	.data

	.text
	.globl main
	.ent main
main:
	li $t2, 48
	li $t3, 57
	and $t1, $t1, $0
	addi $t1, $t1, 10
loop:	li $v0, 12
	syscall
	move $t0, $v0
	blt $t0, $t2, fine
	bgt $t0, $t3, fine
	bne $t0, $t1, loop 

fine:	li $v0, 10
	syscall

	.end main
