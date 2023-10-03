.data
arr: .word 64, 34, 25, 12, 22, 11, 90
n: .word 7
newline: .asciiz "\n"
space: .asciiz " "

.text
main:
    la $s0, arr  # Endereço base do array
    lw $s1, n    # Tamanho do array

    # Outer loop
    li $s2, 1    # i = 1
    outer_loop:
        bge $s2, $s1, print_array  # Se i >= n, vá para impressão
        
        move $s3, $s2  # j = i
        sll $t0, $s3, 2  # offset para arr[j]
        add $t0, $t0, $s0  # endereço para arr[j]
        lw $s4, 0($t0)  # key = arr[j]

        # Inner loop
        inner_loop:
            blez $s3, shift_elements  # Se j <= 0, vá para a deslocação
            
            # $t2 = arr[j-1]
            sub $t1, $s3, 1  # t1 = j - 1
            sll $t0, $t1, 2  # offset para arr[j-1]
            add $t0, $t0, $s0  # endereço para arr[j-1]
            lw $t2, 0($t0)
            
            bge $s4, $t2, shift_elements  # Se key >= arr[j-1], vá para a deslocação
            
            # arr[j] = arr[j-1]
            sll $t0, $s3, 2  # offset para arr[j]
            add $t0, $t0, $s0  # endereço para arr[j]
            sw $t2, 0($t0)

            sub $s3, $s3, 1  # j--
            j inner_loop

        # Shift elements
        shift_elements:
            sll $t0, $s3, 2  # offset para arr[j]
            add $t0, $t0, $s0  # endereço para arr[j]
            sw $s4, 0($t0)  # arr[j] = key
        
        addi $s2, $s2, 1  # i++
        j outer_loop
    
    # Print array
    print_array:
        li $s2, 0  # Reseta i para impressão
        print_loop:
            bge $s2, $s1, end_program  # Se i >= n, termina programa
            
            sll $t0, $s2, 2  # offset para arr[i]
            add $t0, $t0, $s0  # endereço para arr[i]
            lw $t1, 0($t0)  # $t1 = arr[i]
            
            move $a0, $t1  # Syscall para imprimir inteiro
            li $v0, 1
            syscall
            
            # Syscall para imprimir espaço
            li $v0, 4
            la $a0, space
            syscall
            
            addi $s2, $s2, 1  # i++
            j print_loop
    
    # Termina programa
    end_program:
        li $v0, 10
        syscall
