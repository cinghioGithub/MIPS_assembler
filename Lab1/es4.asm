	.data
var:	.word 0x3ffffff0
	.text
	.globl main
	.ent main
	
main:	lw $t1, var
	add $t1, $t1, $t1      #prima somma
	move $a0, $t1
	li $v0, 1
	syscall

	addiu $a0, $t1, 40    #seconda somma u=unsigned, senza la u darebbe overflow
	li $v0, 1
	syscall

	li $v0, 10
	syscall
	.end main
	
