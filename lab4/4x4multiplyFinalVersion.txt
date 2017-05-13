main:
	#input first matrix and move it to $a0
	
	la $t0, A
	jal matrixin
	
	la $t0, B
	jal matrixin
	
	la $a1, A
	la $a2, B
	
	la $a0, C
	jal mymatrixmultiply
	move $t0, $a0
	jal matrixout
	
	li $v0, 10 #end the program
	syscall
	

matrixin: #this will store the matrix in the address in register $t0
	li $s1, 0 #index variable for the array address
	add $s1, $s1, $t0 #add the address of the array to the index variable
	li $s2, 0 #index variable for the input string address
	li $s4, 0 #will be the inner loop limit
	li $s3, 1 #index variable for the input row
	li $t2, 0
	outerloop: #outerloop goes through the rows
		#print "input row"
		li $v0, 4 #load the string output code
		la $a0, prompt_input
		syscall 
		li $v0, 1
		move $a0, $s3
		syscall
		li $v0, 4
		la $a0, colon
		syscall #print the colon and space at the end of the prompt
		#get the input string
		li $v0, 8 #string input code
		la $a0, input_string
		lw $a1, input_string_length
		syscall
		la $t1, input_string #load the inputted string into $t1
		add $s2, $s2, $t1 #add the address of the string to the address index variable
		move $s4, $t1 #create the index limit for the inner loop
		addi $s4, $s4, 8
		innerloop: #innerloop parses through the input string
			#parse the input string
			lb $t2, 0($s2) #load the byte from the string
			subi $t2, $t2, 48 #convert from ascii code to the number that code represents
			sw $t2, 0($s1) #store the int into the array
			#increment the string and array address counters
			addi $s2, $s2, 2
			addi $s1, $s1, 4
			beq $s2, $s4, endinner #check if the string counter is past 8
			j innerloop
		endinner:
			li $s2, 0
		#increment the row counter
		addi $s3, $s3, 1
		beq $s3, 5, endouter
		j outerloop
	endouter:
	
	jr $ra
	

matrixout: #this will print the matrix at the address stored in register $t0
	li $s0, 0 #array increment variable
	add $s0, $s0, $t0 #add the base address of the array to the increment variable
	li $s1, 0 #loop limit
	add $s1, $s0, 64 #add the length of the array (x4) to the address of the array to create a loop limit
	li $s2, 1
	loop:
		li $v0, 1
		lw $a0, 0($s0)
		syscall
		li $v0, 4
		la $a0, space
		syscall
		beq $s2, 4, newline
		j nonewline
		newline:
			li $v0, 4
			la $a0, newlinecharacter
			syscall
			li $s2, 0
		nonewline:
		
		addi $s0, $s0, 4 #increment the array variable
		addi $s2, $s2, 1 #newline variable
		beq $s0, $s1, end
		j loop
		
		
	end:
	
	jr $ra
	
mymatrixmultiply: # result matrix in $a0, the two matrices being multiplied are in $a1 and $a2
	#three loops
	#int i, j, k
	#for (i = 0; i != 4; i = i + 1)
	#for (j = 0; j != 4; j = j + 1)
	#for (k = 0; k != 4; k = k + 1)
	#	c[i][j] = c[i][j] + a[i][k] *b[k][j];
	# $t0 loop limit = 4
	# $s0 first loop increment variable
	# $s1 second loop increment variable
	# $s2 third loop increment variable
	li $t0, 4 # loop limit, row size
	li $s0, 0 #initialize first loop 
	loop1: li $s1, 0
		loop2: 
			li $s2, 0
			loop3:
				#do things
				#calculate the address of item in C[i][j] and fetch it 
				mul $t1, $s0, 4 # multiply the first loop increment by four to get the base address of the row
				add $t1, $t1, $s1 # add the column number to the row
				mul $t1, $t1, 4 # multiply by four because words
				add $t1, $t1, $a0 # add the base address of C to $t1
				lw $t4, 0 ($t1) # fetch the item
				#calculate the address of item in A[i][k]
				mul $t2, $s0, 4 # multiply theh first loop increment by four to get the base address of the row
				add $t2, $t2, $s2 # add the column number to the row
				mul $t2, $t2, 4 #multiply by four because words
				add $t2, $t2, $a1 # add the base address of A to $t2
				lw $t5, 0($t2) # fetch the item
				#calculate the address of item in B[k][j]
				mul $t3, $s2, 4 # multiply the third loop increment by four to get the base address of the row
				add $t3, $t3, $s1 # add the column number to the row
				mul $t3, $t3, 4 # multiply by four because words
				add $t3, $t3, $a2 # add the base address of B to $t3
				lw $t6, 0($t3) # fetch the item
				# A[i][k]*B[k][j]
				mul $t7, $t5, $t6
				add $t8, $t4, $t7
				sw $t8, 0($t1)
				
					
				addi $s2, $s2, 1
				beq $s2, $t0, endloop3
				j loop3		
			endloop3:
			
			addi $s1, $s1, 1
			beq $s1, $t0, endloop2
			j loop2
		endloop2:
		
		addi $s0, $s0, 1
		beq $s0, $t0, endloop1
		j loop1
	endloop1:
	
	jr $ra
		
	
	
	

.data
prompt_input: .asciiz "Input Row "
colon: .asciiz ": "
space: .asciiz " "
newlinecharacter: .asciiz "\n"
input_string: .space 50
input_string_length: .word 50
#A: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
#B: .word 16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1
A: .space 64
B: .space 64
C: .space 64
