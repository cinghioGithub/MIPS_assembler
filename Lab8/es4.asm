DIM = 5
    .data
vet1: .word 56, 12, 98, 129, 58
vet2: .word 1, 0, 245, 129, 12
risultato: .space DIM
    .text
    .globl main
    .ent main

main:
    subu $sp, $sp, 4
    sw $ra, ($sp)

    la $a0, vet1
    la $a1, vet2
    la $a2, risultato
    li $a3, DIM

    jal CalcolaDistanzaH

    lw $ra, ($sp)
    addu $sp, $sp, 4

    jr $ra

.end main

CalcolaDistanzaH:

    move $t0, $a0  #vet1
    move $t1, $a1   #vet2
    move $t2, $a2   #risultato
    move $t3, $a3   #DIM

    li $t4, 0

loop1:
    bge $t4, $t3, stop
        lw $t5, ($t0)
        lw $t6, ($t1)

        li $s0, 0

        subu $t7, $t5, $t6
        beq $t7, 0, end

        li $t7, 0
loop2:
        bge $t7, 32, end
            div $t5, $t5, 2
            mfhi $t8

            div $t6, $t6, 2
            mfhi $t9

            sub $t8, $t8, $t9
            beq $t8, 0, wrong
                addi $s0, $s0, 1
wrong:
            addi $t7, $t7, 1
            j loop2
end:

        sb $s0, ($t2)

        move $a0, $s0
        li $v0, 1
        syscall

        addi $t0, $t0, 4
        addi $t1, $t1, 4
        addi $t2, $t2, 1

        addi $t4, $t4, 1

        j loop1

stop:

    jr $ra