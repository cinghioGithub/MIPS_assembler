.data
mat: .word 1 2 3 4
.text
.globl main
.ent main

main:

    la $t0, mat
    lw $a0, ($t0)
    lw $a1, 4($t0)
    lw $a2, 8($t0)
    lw $a3, 12($t0)

    subu $sp, $sp, 4    #salvo nello stack $t0
    sw $t0, ($sp)
    
    jal determinante

    lw $t0, ($sp)
    addu $sp, $sp, 4

    move $t0, $v0

    li $v0, 10
    syscall

.end main

determinante:

    subu $sp, $sp, 4
    sw $s0, ($sp)
    subu $sp, $sp, 4
    sw $s1, ($sp)

    mul $s0, $a0, $a3
    mul $s1, $a1, $a2

    sub $v0, $s0, $s1

    lw $s1, ($sp)
    addu $sp, $sp, 4
    lw $s0, ($sp)
    addu $sp, $sp, 4

    j $ra   