.data
DIM=20
vet:    .word 0:20

.text
.globl main
.ent main

main:

    la $t0, vet   #indirizzo della prima cella
    li $t1, 0

    li $s0, 1
    li $s1, 0

    sw $s0, ($t0)
    sw $s0, 4($t0)

    li $s3, 0
    li $s4, 0
    add $s3, $s0, $0    #registro per cella -2
    add $s4, $s0, $0    #registro per la cella -1
    addi $t0, $t0, 8

    li $s2, 3   #indice per scorrere il vettore

loop:
    bgt	$s2, DIM, stop
    li $s1, 0
    add $s1, $s3, $s4   #calcolo il nuovo valore
    move $s3, $s4       #sposto l'elemento -1 in quello -2
    move $s4, $s1       #sposto l'elemento attuale in -1

    addi $s2, $s2, 1
    sw $s1, ($t0)
    addi $t0, $t0, 4

    j loop

stop:
    li $v0, 10
    syscall

.end main