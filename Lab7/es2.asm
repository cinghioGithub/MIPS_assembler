.data
c0: .word 2
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

    jal calcolaSuccessivo

    move $a0, $v0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

.end main

calcolaSuccessivo:

    #li $s0, 0   #iniszializzo il contatore

    #lw $t0, c0  #salvo il valore di c0
    #move $s1, $a0   #salvo il parametro passato con $a0

    #addi $s1, $s1, 1
#loop:
  #  bge $s0, $s1, stop

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
    #j loop
#stop:

    move $v0, $t0

    jr $ra