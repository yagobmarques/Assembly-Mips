	.data 

str1:	.asciiz "Entre com o K: "
str2:	.asciiz "Entre com o I: "
str3:	.asciiz "Entre com o J: "
str4:	.asciiz "Entre com o G: "
str5:	.asciiz "Entre com o H: "
str6: 	.asciiz "O resultado é: "

	.text
	.globl main

main:
	# Print Entrada K
	li $v0, 4
	la $a0, str1
	syscall
	
	# Entrando com K
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Print Entrada I
	li $v0, 4
	la $a0, str2
	syscall
	
	# Entrando com I
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Print Entrada J
	li $v0, 4
	la $a0, str3
	syscall
	
	# Entrando com J
	li $v0, 5
	syscall
	move $t2, $v0
	
	# Print Entrando G
	li $v0,4
	la $a0, str4
	syscall 
	
	# Entrando com G
	li $v0, 5
	syscall
	move $t3, $v0
	
	# Print Entrando H
	li $v0,4
	la $a0, str5
	syscall 
	
	# Entrando com H
	li $v0, 5
	syscall
	move $t4, $v0
	
	beq $t0, 0, k1
	beq $t0, 1, k2
	beq $t0, 2, k3
	beq $t0, 3, k4
	
	j fim
	
	
k1:
	add  $t4, $t1, $t2
	j mostra_int
k2:
	add $t4, $t3, $t4
	j mostra_int
k3:
	sub  $t4, $t3, $t4
	j mostra_int
k4:			
	sub   $t4, $t1, $t4
	j mostra_int		
	
mostra_int:
	li $v0, 4
	la $a0, str6
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	j fim
fim:
	li $v0, 10
	syscall  	 
