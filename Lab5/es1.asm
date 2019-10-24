.data
var: .word 3141592653

.text
.globl main
.ent main

main:
    li $t0, 0   #contatore di iterazioni
    li $t1, 0   #salva il risultato della divisione

    lw $s0, var   #salvo il valore di var
    li $t3, 1   #inizializzo $t3
    add $t4, $sp, $0    
    subu $t4, $t4, 4    #salvo il valore iniziale delo stack pointer

loop:
    li $s4, 10

    divu $s0, $s4   #divido var per 10

    mflo $t2        #salvo il valore del resto
    mfhi $t3         #salvo il risultato della divisione

    beq $t3, $0, stop

    mflo $s0
    subu $sp, $sp, 4
    sw $t3, ($sp)
    
    j loop

stop:
    #add $s2, $sp, $0   #salvo il vaore finale dello stack pointer
    addu $t4, $t4, 4
print:
    beq $sp, $t4, end

    lw $a0, ($sp)
    addi $a0, $a0, '0'
    li $v0, 11
    syscall

    addu $sp, $sp, 4
    j print
end:

    li $v0, 10
    syscall

.end main