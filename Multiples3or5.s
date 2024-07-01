.text
main:	
	# counter or i
	li $s1,1	
	
	# limit
	li $a2,10	
	
	# Initialize loop counter to 1
	li $t1, 1
	loop:
		rem $t2,$t1,3
		beq $t2,0, print
		
		rem $t2,$t1,5
		beq $t2,0, print
			
		addi $t1,$t1,1			
				
		blt $t1, $a2, loop
		j endloop
	print:
		move $a0, $t1
		li $v0, 1		
		syscall 
		addi $t1,$t1,1	
		blt $t1, 10, loop 
			
	endloop:
		li $v0,10
		syscall
