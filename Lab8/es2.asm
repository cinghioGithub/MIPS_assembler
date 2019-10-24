.data
DIM: .word 6
anni: .word 1945 2008 1800 2006 1748 1600
risultato: .space 6
.text
.globl main
.ent main

main:

    subu $sp, $sp, 4
    sw $ra, ($sp)

    la $a0, anni
    la $a1, risultato
    lw $a2, DIM

    jal bisestile

    lw $ra, ($sp)
    addu $sp, $sp, 4
    
    jr $ra

.end main

bisestile:
    move $t0, $a0   #anni
    move $t7, $a1   #risultato
    move $t2, $a2   #dimensione

    li $t3, 0   #contatore

loop:
    bge $t3, $t2, stop

    mul $t4, $t3, 4     #offset vettore di anni
    add $t0, $t0, $t4
    add $t1, $t7, $t3

    lw $t5, ($t0)   #carico l'anno in $t5

    div $t6, $t5, 100

    mfhi $t6
    bne $t6, $0, err

        div $t6, $t5, 400
        mfhi $t6
        bne $t6, $0, err2
            li $t6, 1
            sb $t6, ($t1)
            j end
err2:
            li $t6, 0
            sb $t6, ($t1)
            j end
err:
    div $t6, $t5, 4

    mfhi $t6
    bne $t6, $0, err3
        li $t6, 1
        sb $t6, ($t1)
        j end
err3:
        li $t6, 0
        sb $t6, ($t1)

end:
    move $a0, $t6
    li $v0, 1
    syscall

    addi $t3, $t3, 1
    j loop

stop:

    jr $ra