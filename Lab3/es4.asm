	.data
	DIM = 5

	.text
	.globl main
	.ent main
main:
	li $s0, 1
	li $s1, 0

loop:	bgt $s0, DIM, fine
	
	li $v0, 5
	syscall
	add $s1, $s1, $v0
	
	addi $s0, $s0, 1
	j loop

fine:	div $s1, $s1, DIM

	li $v0, 10
	syscall

	.end main
