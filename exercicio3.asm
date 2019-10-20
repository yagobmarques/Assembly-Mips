.data 
str1: .asciiz "Entre com um número: "
str2: .asciiz "A raiz dele é: "
	.text 
	.globl main
main:
	# Print da entrada do inteiro
	li $v0, 4
	la $a0, str1
	syscall
	
	# Pegando o inteiro do usuário
	li $v0,5
	syscall
	move $s1, $v0 # s1 = x
	beq $s1, 4, mostrar_4
	j root

mostrar_4:	# Função que evita o bug do 4 :)
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	la $a0, 2
	syscall
	j fim
		
	
root: # Função que calcula a raiz de um número
	add $s2, $zero, 1 # s2 = r
	add $s3, $zero, 2 # s3 = d
	add $s4, $zero, 4 # s4 = s
	#add $s5, $zero, 1 # s5 = t
	j while
	
while: # Função para o laço do programa
	add $s2, $s2,1
	add $s3, $s3,2
	add $s4, $s4, $s3
	add $s4, $s4, 1
	slt $s5, $s4, $s1
	beq $s5,1,while
	j mostrar
mostrar:
	add $s2, $s2, 1
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
fim:
	li $v0, 10
	syscall
