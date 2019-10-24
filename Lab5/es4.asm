.data
DIM=9
.mat: .word 1 0 0 0 1 0 0 0 1

.text
.globl main
.ent main

main:
    

    li $v0, 10
    syscall

.end main