	.data 
str1: .asciiz "Entre com a temperatura: "
str2: .asciiz "A temperatura não está no intervalo"
str3: .ascii "A temperatura está no intervalo permitido"

	.text 
	.globl main
main:
	# Print entrada da temperatura
	li $v0, 4
	la $a0, str1
	syscall
	
	# Entrando com a temperatura
	li $v0, 5
	syscall 
	move $s0, $v0  
	j fim
	
	
fim: 
	li $v0, 10
	syscall 
