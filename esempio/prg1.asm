	.data
variable:.space 4    #int variable

	.text
	.globl main
	.ent main
main:	
	li $t0, 10
	sw $t0, variable

	li $v0, 10
	syscall
	.end main
