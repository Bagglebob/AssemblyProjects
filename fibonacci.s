.text
main:	
	# initial value
	li $t1, 1
	# limit
	li $s4, 10
	
	# previous 2 terms
	li $s1, 1	# Fibonacci(n-1)
	li $s2, 1	# Fibonacci(n-2)
	loop:		
		blt $t1, $s4, fib
		
		beq $t1, $s4, endloop				       	 
		
		# always print
		j print			
	print:
		# print
		move $a0, $s1
        	li $v0, 1        
        	syscall 
        	addi $t1, $t1, 1
        	j loop        	
	fib:		
		# adds s1 + s1 | s1 is originally 1
		add $a0, $s1, $s2
        	move $s1, $s2
        	move $s2, $a0  
        	j print       	 	    	
	endloop:
		li $v0,10
		syscall
	
