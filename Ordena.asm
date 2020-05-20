.data
num: .asciiz "Digite o vetor:\n"
resultado: .asciiz "Vetor ordenado:\n"
espaco: .asciiz " "
vetor: .word 0:9
tamanho: .word 5
	
.text
#Preenchendo o vetor
la $s0, vetor
la $s1, tamanho
add $t4, $zero, $s0
lw $t2, 0($s1)
li $t3, 0
addi $t5, $t2, -1
li $t6, 1
li $t7, 0
li $v0, 4
la $a0, num
syscall
	
recebe:
	li $v0, 5
	syscall
	sw $v0, 0($s0)
	addi $s0, $s0, 4
	addi $t2, $t2, -1
	bgt $t2, $t3, recebe
	add $s0, $zero, $t4
	addi $t2, $t2, 5
		
#ordenando o vetor
ordena1:
	add $t7, $zero, $t3 
	bne $t5, $t6, ordena2
	j print
ordena2:
	bne $t7, $t5, posicao
	addi $t5, $t5, -1
	j ordena1
posicao:
	sll $t8, $t7, 2
	addu $t8, $t8, $s0
	lw $t0, 0($t8)
	lw $t1, 4($t8)
	j ordena3
ordena3:
	bgt $t0, $t1, troca
	j proximo
troca:
	sw $t1, 0($t8)
	sw $t0, 4($t8)
	j proximo	
proximo:
	addi $t7, $t7, 1
	j ordena2
		
#printa o vetor ordenado
print:
	li $v0, 4
	la $a0, resultado
	syscall	
loop:
	li $v0, 1
	lw $a0, 0($s0)
	syscall	
	li $v0, 4
	la $a0, espaco
	syscall
	addi $s0, $s0, 4
	addi $t2, $t2, -1
	bgt $t2, $t3, loop