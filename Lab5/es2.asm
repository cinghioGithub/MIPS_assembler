.data
msg: .asciiz "NON palindroma"
msg1: .asciiz "palindroma"

.text
.globl main
.ent main

main:

    addu $s0, $sp, $0   #salvo in $s0 il valore iniziale dello stack pointer
    #subu $s0, $s0, 4

loop:

    li $v0, 12
    syscall
    move $t0, $v0		#$t0 = $v0

    beq $t0, '\n', stop

    subu $sp, $sp, 4
    sw $t0, ($sp)       #salvo $t0 nello stack

    j loop
stop:

    subu $s0, $s0, 4

check:

    blt	$s0, $sp, ottimo	# if $s0 < sp ottimo

    lw $t3, ($s0)
    lw $t4, ($sp)
    
    bne $t4, $t3, errore
    subu $s0, $s0, 4
    addu $sp, $sp, 4

    j check

ottimo:
    la $a0, msg1
    li $v0, 4
    syscall
     j end

errore:
    la $a0, msg
    li $v0, 4
    syscall

end:
    li $v0, 10
    syscall

.end main