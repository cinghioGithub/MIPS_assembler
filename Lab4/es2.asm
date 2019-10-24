.data
opa: .word 2043
opb: .word 5
res: .word 0
msgin: .asciiz "Ins operazione[0->3]: "
table: .word op1, op2, op3, op4

.text
.globl main
.ent main

main:
    la $a0, msgin   #stampo il messaggio di input
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t0, $v0      #salvo in $t0 il valore letto da tastiera

    lw $s0, opa
    lw $s1, opb

    lw $t1, table
    mul $t0, $t0, 4
    add $t1, $t1, $t0
    jr $t1

op1:                        #a+b
    add $s2, $s1, $s0
    sw $s2, res
    j end
op2:                        #a-b
    sub $s2, $s0, $s1
    sw $s2, res
    j end
op3:                        #a*b
    mul $s2, $s1, $s0
    sw $s2, res
    j end
op4:                        #a/b
    div $s2, $s0, $s1
    sw $s2, res

end:
    li $v0, 10
    syscall

.end main