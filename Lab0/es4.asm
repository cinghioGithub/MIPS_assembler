	.data
	DIM = 5
wVet:	.word 5, 7, 3, 4, 3
wResult:	.space 4
	.text
	.globl main
	.ent main
main:
	la $t0, wVet
	li $t4, DIM
	and $t1, $t1, $0
	and $t2, $t2, $0
label:	addi $t2, $t2, 1
	lw $t3, ($t0)
	add $t1, $t1, $t3
	addi $t0, $t0, 4
	bne $t2, $t4, label

	li $v0, 10
	syscall

	.end main
