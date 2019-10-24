.data
	.text
	.globl main
	.ent main
main:
	li $t0, 10
	li $s0, 0xAB

	li $v0, 10
	syscall
	.end main
