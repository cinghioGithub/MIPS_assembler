.data

.text
.globl main
.ent main

main:

    jal print_triangolo

    li $a0, '\n'
    li $v0, 11
    syscall

    jal print_quadrato

    li $v0, 10
    syscall

.end main

print_triangolo:
    li $t0, 0   #conteggio ciclo esterno
    li $t1, 0   #limite ciclo interno
    li $t2, 0   #conteggio ciclo interno
loop1:
    bge $t0, 8, label
    li $t2, 0

loop2:
    addi $t1, $t0, 1
    bge $t2, $t1, label2

    li $a0, '*'
    li $v0, 11
    syscall

    addi $t2, $t2, 1
    j loop2

label2:

    li $a0, '\n'
    li $v0, 11
    syscall

    addi $t0, $t0, 1
    j loop1

label:
    jr $ra

print_quadrato:
    li $t0, 0   #conteggio ciclo esterno
    li $t2, 0   #conteggio ciclo interno
loop1_q:
    bge $t0, 8, label_q
    li $t2, 0

loop2_q:
    bge $t2, 8, label2_q

    li $a0, '*'
    li $v0, 11
    syscall

    addi $t2, $t2, 1
    j loop2_q

label2_q:

    li $a0, '\n'
    li $v0, 11
    syscall

    addi $t0, $t0, 1
    j loop1_q

label_q:
    jr $ra