.data 
str1: .asciiz "Entre com a temperatura: "
str2: .asciiz "A temperatura não está no intervalo"
str3: .asciiz "A temperatura está no intervalo permitido"
str4: .asciiz "Saindo..."
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
	add $t3, $zero, 41
	add $t4, $zero, 19
	# Remodelando: x > 19 e x < 41
	slt $t1, $s0, $t3
	slt $t2, $t4, $s0
	beq $t1, $t2, padrao
	li $v0, 4
	la $a0, str2
	syscall
	j fim
padrao:
	li $v0, 4
	la $a0, str3
	syscall	
fim: 
	li $v0, 10
	syscall 
