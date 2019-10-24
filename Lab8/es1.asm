.data
o1: .byte 12 47
o2: .byte  18 14
x: .word 1
y: .word 40
.text
.globl main
.ent main

main:

    lb $s0, o1
   la $s1, o1
  lb $s2, 1($s1)

  lb $s3, o2
  la $s1, o2
   lb $s4, 1($s1)

   sub $a0, $s3, $s0
  sub $a1, $s4, $s2

#    la $a0, o1
#    la $a1, o2
#
#    lw $a2, x
#    lw $a3, y

    jal costoParcheggio

    move $s0, $v0

    li $v0, 10
    syscall

.end main

costoParcheggio:

    mul $t0, $a0, 60
    add $t0, $t0, $a1

    lw $t1, y
    lw $t2, x

    div $t3, $t0, $t1
    mfhi $t4

    beq $t4, $0, label

    addi $t3, $t3, 1

label:
    mul $v0, $t3, $t2

jr $ra