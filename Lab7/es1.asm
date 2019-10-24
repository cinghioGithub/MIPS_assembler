.data

.text
.globl main
.ent main

main:
    li $t0, 15
    li $t1, 16
    li $t2, 17
    li $t3, 18

    li $s0, 223
    li $s1, 224
    li $s2, 225
    li $s3, 226

    subu $sp, $sp, 4		# $sp = sp1 - 4
    sw $t0, ($sp)              #salvo nello stack v1
    subu $sp, $sp, 4
    sw $s0, ($sp)              #salvo nello stack v2   
    
    subu $sp, $sp, 4     #salvo nello stack da $t0 a $t3
    sw $t0, ($sp)
    subu $sp, $sp, 4
    sw $t1, ($sp)
    subu $sp, $sp, 4
    sw $t2, ($sp)
    subu $sp, $sp, 4
    sw $t3, ($sp)

    jal somma

    move $t4, $v0

    lw $t3, ($sp)
    addu $sp, $sp, 4
    lw $t2, ($sp)
    addu $sp, $sp, 4
    lw $t1, ($sp)
    addu $sp, $sp, 4
    lw $t0, ($sp)
    addu $sp, $sp, 4

    li $v0, 10
    syscall

.end main

somma:
    
    subu $sp, $sp, 4    #salvo nello stack da $s0 a $s3
    sw $s0, ($sp)
    subu $sp, $sp, 4
    sw $s1, ($sp)
    subu $sp, $sp, 4
    sw $s2, ($sp)
    subu $sp, $sp, 4
    sw $s3, ($sp)

    li $t0, 0
    li $t1, 0
    li $t2, 0
    li $t3, 0
    li $t4, 0

    li $s0, 0
    li $s1, 0
    li $s2, 0
    li $s3, 0
    li $s4, 0

    lw $t2, 32($sp) #salvo il valore di $s0
    lw $s2, 36($sp) #salvo il valore di $t0

    add $v0, $t2, $s2

    lw $s3, ($sp)           #ripristino i registri
    addu $sp, $sp, 4
    lw $s2, ($sp)
    addu $sp, $sp, 4
    lw $s1, ($sp)
    addu $sp, $sp, 4
    lw $s0, ($sp)
    addu $sp, $sp, 4

    jr $ra