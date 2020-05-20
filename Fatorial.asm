.data
num: .asciiz "Insira o numero: "
resposta: .asciiz "O resultado do fatorial e: "
	
.text
# Recebe o numero
li $t3,1
li $v0, 4
la $a0, num
syscall
li $v0, 5
syscall
move $t1, $v0
move $s1, $t1
sub $t2, $t1, $t3
	
#Calcula o fatorial	
loop:	mult $s1, $t2
	mflo $s1
	sub $t2, $t2, $t3
	bne $t3, $t2, loop  #enquanto forem diferentes segue o loop
				
#  Mostra o resultado
li $v0, 4
la $a0, resposta
syscall
li $v0, 1
move $a0, $s1
syscall
	
