.data
#$s0 = a
#$s1 = b
#$s2 = c
#$t1 = 4ac 
#t0 = delta
#t2 = ($t0 > 0)
msg: .asciiz "ok"
msg1: .asciiz "no"

.text
.globl main
.ent main

main:
    li $v0, 5       #inserisci a
    syscall
    move $s0, $v0

    li $v0, 5       #inserisci b
    syscall
    move $s1, $v0

    li $v0, 5       #inserisci c
    syscall
    move $s2, $v0

    mul $t0, $s1, $s1     #b^2
    mul $t1, $s0, $s2
    mul $t1, $t1, 4     #4ac

    sub $t0, $t0, $t1    #delta

    slt $t2, $t0, $0
    beq $t2, $0, ok
    j no

ok:
    la $a0, msg
    li $v0, 4
    syscall
    j end
    
no:
    la $a0, msg1
    li $v0, 4
    syscall

end:
    li $v0, 10
    syscall

.end main