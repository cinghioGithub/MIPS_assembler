	.data
wVar:	.word 3
	.text

	.globl main
	.ent main

main:
	li $s0, 10
	sw $s0, wVar

	li $v0, 10
	syscall
	
	.end main
