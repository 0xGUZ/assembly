.data
arr: .word 64, 34, 25, 12, 22, 11, 90
n: .word 7
newline: .asciiz "\n"
space: .asciiz " "

.text
main:
    la $s0, arr  # endereco base do array
    lw $s1, n    # tamanho do array

    # Loop externo
    li $s2, 0    # i = 0
    outer_loop:
        bge $s2, $s1, end_outer_loop  # se i >= n, sai do loop externo
        
        move $s3, $s2    # min_idx = i

        # Loop interno
        addi $s4, $s2, 1  # j = i + 1
        inner_loop:
            bge $s4, $s1, swap_elements  # se j >= n, vai para troca
            
            sll $t0, $s3, 2  # offset para arr[min_idx]
            add $t0, $t0, $s0  # endereco para arr[min_idx]
            lw $t1, 0($t0)  # $t1 = arr[min_idx]
            
            sll $t0, $s4, 2  # offset para arr[j]
            add $t0, $t0, $s0  # endereco para arr[j]
            lw $t2, 0($t0)  # $t2 = arr[j]
            
            bge $t2, $t1, update_j  # se arr[j] >= arr[min_idx], continua
            
            move $s3, $s4  # min_idx = j
            
            update_j:
            addi $s4, $s4, 1  # j++
            j inner_loop
            
        # Trocar elementos
        swap_elements:
            sll $t0, $s2, 2  # offset para arr[i]
            add $t0, $t0, $s0  # endereco para arr[i]
            lw $t1, 0($t0)  # $t1 = arr[i]
            
            sll $t2, $s3, 2  # offset para arr[min_idx]
            add $t2, $t2, $s0  # endereco para arr[min_idx]
            lw $t3, 0($t2)  # $t3 = arr[min_idx]
            
            sw $t3, 0($t0)  # arr[i] = arr[min_idx]
            sw $t1, 0($t2)  # arr[min_idx] = arr[i]

        addi $s2, $s2, 1  # i++
        j outer_loop
    
    end_outer_loop:
        # Imprimir array
        li $s2, 0  # Reinicia i pro print
        print_loop:
            bge $s2, $s1, end_program  # se i >= n, termina o programa
            
            sll $t0, $s2, 2  # offset para arr[i]
            add $t0, $t0, $s0  # endereco para arr[i]
            lw $t1, 0($t0)  # $t1 = arr[i]
            
            move $a0, $t1  # Syscall para imprimir inteiro
            li $v0, 1
            syscall
            
            # Syscall para imprimir espaco
            li $v0, 4
            la $a0, space
            syscall
            
            addi $s2, $s2, 1  # i++
            j print_loop
    
    end_program:
        # Terminar programa
        li $v0, 10
        syscall
