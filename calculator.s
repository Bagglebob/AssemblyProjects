.data
welcome:
	.asciiz "Welcome to my Calculator\n"
num:
	.asciiz "Enter a number: "
sign:
	.asciiz "Enter a operator: "
endLine: 
	.asciiz "\n"
answer:
	.asciiz "Your answer is: "
		
.text
main:
	#s1 stores num1
	#s2 stores operator
	#s3 stores num2
	
	#print welcome message
	li $v0,4
	la $a0, welcome
	syscall
	
	#ask for number
	li $v0,4
	la $a0, num
	syscall
	
	#read integer
	li $v0, 5
	syscall
	
	#move entered number into register
	move $s1, $v0
	
	#ask for operator
	li $v0,4
	la $a0, sign
	syscall
	
	#read sign
	li $v0, 12
	syscall
	
	#move operator to s2
	move $s2, $v0		
	
	#print newline
	li $v0,4
	la $a0, endLine
	syscall
		
	#ask for operand
	li $v0,4
	la $a0, num
	syscall
	
	#read integer
	li $v0, 5
	syscall
	
	#move entered number into register
	move $s3, $v0	
	
	#check if operator is +
	li $t1, 43 #43 is ASCII code for '+'
	beq $s2, $t1, addition
	
	#check if operator is '-'
	li $t1, 45 #45 is ASCII code for '-'
	beq $s2, $t1, subtract	
	
	#Check if operator is '*'
	li $t1, 42 # ASCII code for '*'
	beq $s2, $t1, multiply
	
	#Check if operator is '/'
	li $t1, 47 # ASCII code for '/'
	beq $s2, $t1, divide
	
	j end
end:
	li $v0,10
	syscall
printline:
	li $v0,4
	la $a0, endLine
	syscall
addition:
	li $v0, 4
	la $a0, answer
	syscall
	add $s4, $s1, $s3	
	li $v0, 1
	move $a0, $s4
	syscall
	j end
subtract:
	li $v0, 4
	la $a0, answer
	syscall
	sub $s4, $s1, $s3
	li $v0, 1
	move $a0, $s4
	syscall
	j end
multiply:
	li $v0, 4
	la $a0, answer
	syscall
	mul $s4, $s1, $s3
	li $v0, 1
	move $a0, $s4
	syscall
	j end
divide:
	li $v0, 4
	la $a0, answer
	syscall
	div $s4, $s1, $s3
	li $v0, 1
	move $a0, $s4
	syscall
	j end
	
	