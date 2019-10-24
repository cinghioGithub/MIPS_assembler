.data
v1: .word 1 2 3 4
v2: .word 1 2 3 4
mat: .word 0:16

.text
.globl main
.ent main

main:
    la $t0, v1      #$t0=v1[0]
    la $t1, v2      #$t1=v2[0]
    la $t2, mat     #$t2=mat[0][0]

    li $s0, 0  #indice si riga
    li $s1, 0  #indice di colonna

loop1:
    bge $s1, 4, end
loop2:  
    li $s0, 0
    

end:

    li $v0, 10
    syscall

.end main