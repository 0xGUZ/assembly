.data
arr: .word 1 2 3 4 5 6 7 8 9 10
n: .word 10 #len of arr
newline: .asciiz "\n"
space: .asciiz " "

.text
lw $s1, n #len of arr
mul $t0, $s1, 4 #t0 = offset to reach the last element

la $s0, arr #s0 points to first element
add $s2, $s0, $t0 #s2 points to last element

li $t1, 0 # loop counter
li $t3, 2 # using $t3 to store the divisor
divu $s1, $t3 # $s1 / 2
mflo $t2 # upper bound for loop

Inverter:
    bge $t1, $t2, Fim #loop counter == upper bound
    
    lw $t6, 0($s0) # temp1 = arr[i]
    lw $t7, 0($s2) # temp2 = arr[j]
    sw $t7, 0($s0) # arr[1] = temp2
    sw $t6, 0($s2) # arr[j] = temp1
    
    addi $s0, $s0, 4 #caminha ponteiro pra direita
    addi $s2, $s2, -4 #caminha ponteiro pra esquerda
    
    addi $t1, $t1, 1 # i++
    j Inverter 
Fim:
    la $a0, arr #arr 1 pos
    la $s7, arr
    lw $a1, n #arr len
    jal printArray #chama func print
    
    #termina programa
    li $v0, 10
    syscall
    
printArray:
    li $t0, 0 #indice i
    
    printLoop:
        bge $t0, $a1, endPrint #se percorreu todos elementos nao loopa
        
        #printa numero
        lw $a0, 0($s7)
        li $v0, 1
        syscall
        
        #printa espaco
        la $a0, space
        li $v0, 4
        syscall
        
        #atualiza indices e ponteiros
        addi $t0, $t0, 1
        addi $s7, $s7, 4
        j printLoop
    endPrint:
        #printa newline
        la $a0, newline
        li $v0, 4
        syscall
        jr $ra
