.data
word: .asciiz "ciao"
.text
.globl main
.ent main

main:

#    la $a0, msg
#    li $v0, 4
#    syscall

#    li $v0, 8      #leggo la parola da convertire da tastiera
#    syscall

#    move $s0, $a0     #carico in $s0 l'indirizzo della stringa letta da tastiera
#    move $s4, $a1       #salvo la dimensione della stringa

    la $s0, word
    li $t1, 0

loop:
    bge $t1, 4, stop

    move $a0, $s0
    jal convertion

    move $a0, $v0
    li $v0, 11
    syscall

    addi $s0, $s0, 1
    addi $t1, $t1, 1
    j loop

stop:
    li $v0, 10
    syscall

.end main

convertion:
    add $t0, $a0, $0    #carico in $t0 il carattere della stringa letta da tastiera

    li $t2, 'A'
    li $t3, 'a'
    sub $t2, $t2, $t3     #salvo in $t2 l'offset da sommare al carattere minuscolo per farlo diventare maiuscolo

    lb $s4, ($t0)
    add $v0, $s4, $t2

    j $ra