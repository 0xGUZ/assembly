.data
arr: .word 1 2 3 4 5 6 7 8 9 10
n: .word 11 #len of arr
.text
lw $s1, n
mul $t0, $s1, 4 #t0 = offset pra chegar no ultimo elemento
lw $t1, $t0(arr)
Inverter:



Fim:
