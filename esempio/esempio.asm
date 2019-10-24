	.data
op1:	.byte 3
op2:	.byte 2
res:	.space 1

	.text
	.globl main
	.ent main
main:
	lb $t1, op1
	lb $t2, op2
	add $t3, $t1, $t2
	sb $t3, res
	li $v0, 10
	syscall
	.end main

