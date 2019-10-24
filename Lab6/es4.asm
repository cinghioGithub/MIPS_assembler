.data
DIM = 7
vet: .word 2 5 12 2 0 3 1
.text
.globl main
.ent main

main:

    la $a0, vet
    li $a1, DIM

    jal massimo

    li $v0, 10
    syscall

.end main

massimo:
    move $t0, $a0   #salvo in $t0, l'indirizzo del vettore
    move $t1, $a1   #salvo in $t1 la dimensione del vettore

    lw $t4, ($t0)    #$t4 = max, all'inizio il primo valore del vettore
    li $t2, 0

loop:
    bge $t2, $t1, end_procedure

    lw $t3, ($t0)
    slt $t5, $t4, $t3

    beq $t5, 0, false
    add $t4, $t3, $0

false:
    addi $t2, $t2, 1
    addi $t0, $t0, 1
    j loop

end_procedure:
    move $v0, $t4
    j $ra