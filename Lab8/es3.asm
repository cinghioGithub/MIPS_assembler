NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1
    .data
prezzi: .word 39, 1880, 2394, 1000, 1590
scontati: .space DIM
    .text
    .globl main
    .ent main

main:
    subu $sp, 4         #salvo $ra nello stack
    sw $ra, ($sp)

    la $a0, prezzi
    la $a1, scontati
    li $a2, NUM
    li $a3, SCONTO
    li $t0, ARROTONDA
    subu $sp, 4
    sw $t0, ($sp)

    jal calcola_sconto
    move $s0, $v0

    lw $t0, ($sp)
    addu $sp, $sp, 4

    lw $ra, ($sp)
    addu $sp, $sp, 4    #ripristino di $ra
    jr $ra

.end main

calcola_sconto:
    move $t0, $a0   #prezzi
    move $t1, $a1   #scontati
    move $t2, $a2   #NUM
    move $t3, $a3   #SCONTO

    lw $t4, ($sp)       #ARROTONDA
    addu $sp, $sp, 4

    li $t5, 0
    li $t9, 0
loop:
    bge $t5, $t2, stop

        lw $t6, ($t0)   #leggo un elemento dal vettore
        mul $t7, $t6, $t3
        div $t7, $t7, 100       #quantita da scontare

        mfhi $t8
        mul $t8, $t8, 2

        bgt $t8, 100, greater
            beq $t8, 0, end_greater
                bne $t4, 0, one
                    addu $t7, $t7, 1
                    j end_greater
one:
                    subu $t7, $t7, 1
greater:
        addu $t7, $t7, 1

end_greater:
        sub $t6, $t6, $t7  #colcolo il nuovo prezzo
        add $t9, $t9, $t7

        sw $t6, ($t1)
        addu $t1, $t1, 4
        addu $t0, $t0, 4

        addu $t5, $t5, 1
        j loop
stop:

    move $v0, $t9       #salvo in $v0, il valore di ritorno
    subu $sp, $sp, 4
    sw $t4, ($sp)

    jr $ra