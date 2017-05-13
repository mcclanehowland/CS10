main:
	la $t0,M
	jal matrix
	li $v0,10
	syscall
	
matrix:
	#prompt for row 1
	li $v0, 4 #load string output code
	la $a0, prompt_input #load "Input Row"
	syscall
	li $v0,1 #integer output code
	li $a0, 1 #load the input row count into the output register
	syscall
	li $v0, 4 #load string output code
	la $a0, colon #load the colon
	syscall
	li $v0, 8 #load string input code
	la $a0, input_string
	lw $a1, input_string_length
	syscall

	#parse the input string for numbers
	la $t1, input_string
	addi $t1,$t1,0 #add the base address and index
	lb $t2, 0($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 0($t0) #store the integer into the array
	lb $t2, 2($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 4($t0) #store the integer into the array
	lb $t2, 4($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 8($t0) #store the integer into the array
	lb $t2, 6($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 12($t0) #store the integer into the array
	lb $t2, 8($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 16($t0) #store the integer into the array

	#prompt for row 2
	li $v0, 4 #load string output code
	la $a0, prompt_input #load "Input Row"
	syscall
	li $v0,1 #integer output code
	li $a0, 2 #load the input row count into the output register
	syscall
	li $v0, 4 #load string output code
	la $a0, colon #load the colon
	syscall
	li $v0, 8 #load string input code
	la $a0, input_string
	lw $a1, input_string_length
	syscall

	#parse the input string for numbers
	la $t1, input_string
	addi $t1,$t1,0 #add the base address and index
	lb $t2, 0($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 20($t0) #store the integer into the array
	lb $t2, 2($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 24($t0) #store the integer into the array
	lb $t2, 4($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 28($t0) #store the integer into the array
	lb $t2, 6($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 32($t0) #store the integer into the array
	lb $t2, 8($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 36($t0) #store the integer into the array

	#prompt for row 3
	li $v0, 4 #load string output code
	la $a0, prompt_input #load "Input Row"
	syscall
	li $v0,1 #integer output code
	li $a0, 3 #load the input row count into the output register
	syscall
	li $v0, 4 #load string output code
	la $a0, colon #load the colon
	syscall
	li $v0, 8 #load string input code
	la $a0, input_string
	lw $a1, input_string_length
	syscall

	#parse the input string for numbers
	la $t1, input_string
	addi $t1,$t1,0 #add the base address and index
	lb $t2, 0($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 40($t0) #store the integer into the array
	lb $t2, 2($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 44($t0) #store the integer into the array
	lb $t2, 4($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 48($t0) #store the integer into the array
	lb $t2, 6($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 52($t0) #store the integer into the array
	lb $t2, 8($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 56($t0) #store the integer into the array

	#prompt for row 3
	li $v0, 4 #load string output code
	la $a0, prompt_input #load "Input Row"
	syscall
	li $v0,1 #integer output code
	li $a0, 4 #load the input row count into the output register
	syscall
	li $v0, 4 #load string output code
	la $a0, colon #load the colon
	syscall
	li $v0, 8 #load string input code
	la $a0, input_string
	lw $a1, input_string_length
	syscall

	#parse the input string for numbers
	la $t1, input_string
	addi $t1,$t1,0 #add the base address and index
	lb $t2, 0($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 60($t0) #store the integer into the array
	lb $t2, 2($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 64($t0) #store the integer into the array
	lb $t2, 4($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 68($t0) #store the integer into the array
	lb $t2, 6($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 72($t0) #store the integer into the array
	lb $t2, 8($t1) #load byte from string,offset is the index
	subi $t2,$t2,48 #change from ascii code to integer
	sw $t2, 76($t0) #store the integer into the array

	#print the rows
	li $v0,4
	la $a0,output1
	syscall
	li $v0,1
	lb $a0,0($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,4($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,8($t0)
	syscall 
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,12($t0)
	syscall
	li $v0,4
	la $a0,newline
	syscall
	#row 2
	li $v0,4
	la $a0,output2
	syscall
	li $v0,1
	lb $a0,20($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,24($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,28($t0)
	syscall 
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,32($t0)
	syscall
	li $v0,4
	la $a0,newline
	syscall
	#row 3
	li $v0,4
	la $a0,output3
	syscall
	li $v0,1
	lb $a0,40($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,44($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,48($t0)
	syscall 
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,52($t0)
	syscall
	li $v0,4
	la $a0,newline
	syscall
	#row 4
	li $v0,4
	la $a0,output4
	syscall
	li $v0,1
	lb $a0,60($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,64($t0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,68($t0)
	syscall 
	li $v0,4
	la $a0,space
	syscall
	li $v0,1
	lb $a0,72($t0)
	syscall
	li $v0,4
	la $a0,newline
	syscall
	
	jr $ra



.data
prompt_input: .asciiz "Input Row "
output1: .asciiz "Row 1: "
output2: .asciiz "Row 2: "
output3: .asciiz "Row 3: "
output4: .asciiz "Row 4: "
colon: .asciiz ": "
space: .asciiz " "
input_string: .space 50
input_string_length: .word 50
newline: '\n'
M: .space 100