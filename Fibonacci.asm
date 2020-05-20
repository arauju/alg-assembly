.data
	chamada: .asciiz  "Numeros da sequencia fibonacci:\n"
	espaco:.asciiz  " "          #espaço
	fibo: .word   0 : 11        
	tamanho: .word      10         #tamanho do vetor

.text	
        la   $t0, fibo       
        la   $t5, tamanho     
        lw   $t5, 0($t5)      
        li   $t1, 1           
        sw   $t1, 0($t0)      
        sw   $t1, 4($t0)     
        addi $t2, $t5, -2     
      
 loop:   
	lw   $t3, 0($t0)      # posicao n
        lw   $t4, 4($t0)      # posicao n+1
        add  $t1, $t3, $t4    # $t1 recebe a soma das duas posicao anteriores
        sw   $t1, 8($t0)      # posicao n+2 recebe a soma das 2 anteriores
        addi $t0, $t0, 4      # vai para a proxima posicao
        addi $t2, $t2, -1     # diminui um no contador de posicao
        bgtz $t2, loop
        	
        la   $a0, fibo        # primeiro 
        add  $a1, $zero, $t5  # segundo 
        jal  print            #imprime
        li   $v0, 10         #tamanho do vetor
        syscall               
		
#Mostrando os numeros
print:
	add  $t0, $zero, $a0  
        add  $t2, $zero, $a1  
        la   $a0, chamada        
        li   $v0, 4          
        syscall               
out:  
	lw   $a0, 0($t0)     
        li   $v0, 1           
        syscall               
        la   $a0, espaco      
        li   $v0, 4           
        syscall               
        addi $t0, $t0, 4      #proxima posicao do vetor
        addi $t2, $t2, -1     # aumenta a posicao
        bgtz $t2, out         
        jr   $ra              # retorna para a funcao
	
