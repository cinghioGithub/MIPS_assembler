	#$s0 : accumulatore
	#$s1 : valore decimale del numero inserito
	#$s5 : valore temporaneo per il controllo di overflow
	#$t0 : salvataggio carattere letto
	#$t1 : valore di '\n'
	#$t2 : valore di '0'
	#$t3 : valore di '9'
	.data
err_msg:	.asciiz "Errore: numero non rappresentabile su 4 byte"
	.text
	.globl main
	.ent main
main:
	li $s0, 0     #accumulatore
	
	li $t2, '0'
	li $t3, '9'
	li $t1, '\n'  #'\n'=10
loop:	li $v0, 12		#leggo un carattere
	syscall
	move $t0, $v0

	beq $t0, $t1, fine    #veirfico se il carattere inserito e un '\n'
	
	move $s1, $t0           #copio il valore letto in $s1
	sub $s1, $s1, $t2	#calcolo il valore numerico del carattere inserito (numerico)
	

	li $s3, 0		#salvo il valore dell'accumulatore per verificare che il valore dopo che ci ho
				#sommato il nuovo valore non sia minore
	add $s3, $s3, $s0

	multu $s0, $t1        #moltiplico per 10 l'accumulatre
	mfhi $s5
	bne $s5, $0, stampa
	mflo $s0             #aggiustare questo mflo!!!!!!
	
	addu $s0, $s0, $s1	#sommo all'accumulatore il numero appena inserito  

	slt $s4, $s0, $s3	#verifico che non ci sia overflow
	bne $s4, $0, stampa
	
	blt $t0, $t2, fine    #verifico che il carattere non sia <= del carattere '0'
	bgt $t0, $t3, fine    #verifico che il carattere non sia >= del carattere '9'
	
	j loop

stampa:	li $v0, 4
	la $a0, err_msg
	syscall
	
fine:	li $a0, 0
	add $a0, $a0, $s0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

	.end main
