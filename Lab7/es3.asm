.data
msg: .asciiz "Selezionare elemento da calcolare: "
.text
.globl main
.ent main

main:

    la $a0, msg
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $a0, $v0   #salvo in $a0 il valore letto da tastiera

    jal sequenzaDiCollatz

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

.end main

calcolaSuccessivo:

    subu $sp, $sp, 4
    sw $s2, ($sp)
    subu $sp, $sp, 4
    sw $s0, ($sp)

    move $t0, $a0
    divu $s2, $t0, 2 #divido per 2
    mfhi $s2

    beq $s2, $0, pari
#dispari
    mul $t0, $t0, 3
    addi $t0, $t0, 1

    j end
pari:
    srl $t0, $t0, 1

end:
    addi $s0, $s0, 1

    move $v0, $t0

    lw $s0, ($sp)
    addu $sp, $sp, 4
    lw $s2, ($sp)
    addu $sp, $sp, 4

    jr $ra

sequenzaDiCollatz:

    subu $sp, $sp, 4    #salvo l'indirizzo del programma chiamante
    sw $ra, ($sp)

    move $t0, $a0   #prelevo da $a0 il parametro

    li $t1, 1   #inizializzo il contatore
    li $t2, 1

for:
    ble $t0, $t2, fine
    addi $t1, $t1, 1

    subu $sp, $sp, 4
    sw $t0, ($sp)
    subu $sp, $sp, 4
    sw $t1, ($sp)
    subu $sp, $sp, 4
    sw $t2, ($sp)

    move $a0, $t0
    jal calcolaSuccessivo
    #move $t0, $v0           #prendo il valore di ritorno da calcolaSuccessivo
    move $t0, $v0

    lw $t2, ($sp)
    addu $sp, $sp, 4
    lw $t1, ($sp)
    addu $sp, $sp, 4
    lw $t0, ($sp)
    addu $sp, $sp, 4

    move $t0, $v0
    j for

fine: 

    move $v0, $t1

    lw $ra, ($sp)
    addu $sp, $sp, 4

    j $ra