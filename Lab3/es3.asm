	.data
day:	.byte 2
hour:	.byte 3
minute:	.byte 23
#none:	.byte 0
risultato:	.space 4 #	.word 0
	.text
	.globl main
	.ent main
main:
	li $s0, 60
	li $s1, 24
	
	lb $t0, day
	lb $t1, hour
	lb $t2, minute

	mul $t1, $t1, $s0
	
	mul $t0, $t0, $s1
	mul $t0, $t0, $s0

	add $t2, $t2, $t1
	add $t2, $t2, $t0

	sw $t2, risultato

	li $v0, 10
	syscall

	.end main
