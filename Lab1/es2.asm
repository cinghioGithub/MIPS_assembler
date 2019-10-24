	.data
var1:	.byte 'm'
var2:	.byte 'i'
var3:	.byte 'p'
var4:	.byte 's'
var5:	.byte 0    #serve per determinare il fine stringa
	.text
	.globl main
	.ent main
main:	li $t5, 'A'
	li $t6, 'a'
	sub $t6, $t6, $t5

	lb $t0, var1
	lb $t1, var2
	lb $t2, var3
	lb $t3, var4

	sub $t0, $t0, $t6
	sb $t0, var1
	sub $t1, $t1, $t6
	sb $t1, var2
	sub $t2, $t2, $t6
	sb $t2, var3
	sub $t3, $t3, $t6
	sb $t3, var4

	la $a0, var1   #stampa
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	.end main
	
