.data
arr: .word 1 2 3 4 5 6 7 8 #array
n: .word 8 #size of array

.text
la $s0, arr
li $t1, 0 #soma
li $t2, 0 #indice
lw $t3, n #size of arr

Somatorio:
	bge $t2, $t3 , Fim
	lw $t0, 0($s0)
	add $t1, $t1, $t0
	addi $t2, $t2, 1
	add $s0, $s0, 4
	j Somatorio	
Fim: