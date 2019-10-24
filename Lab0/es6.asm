	.data
	DIM=4
wVett:	.space 20
msg1:	.asciiz "Inserire numeri\n"
msg2:	.asciiz "Numero inserito "
	.text
	.globl main
	.ent main
main:
	la $a0, msg1 #stampa del messaggio msg1
	li $v0, 4
	syscall

load:	
	la $t0, wVett
	and $t1, $t1, $0
	and $t2, $t2, $0
	
	
	li $v0, 10
	syscall

	.end main
