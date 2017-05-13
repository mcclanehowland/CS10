#prompt for name
li $v0,4 #load service number in $v0
la $a0,prompt_name #load address of string to be printed in $a0
syscall
#get the name
li $v0,8 #load serice number in $v0
la $a0,name
lw $a1,namelength
syscall
#prompt for age
li $v0,4 #load service number in $v0	
la $a0,prompt_age #load address of string to be printed in $a0
syscall
li $v0,5 #load in the age
syscall
move $t0,$v0 #store the age in $t0
#greet 
li $v0,4 #load service number in $v0	
la $a0,greeting_string #load address of string to be printed in $a0
syscall 
li $v0,4 #load service number in $v0	
la $a0,name
syscall
#add four to the age and store it in $t2
li $t1,4 #load the constant 4 into $t1
add $t2,$t0,$t1 #add age and 4
#print the first part of the age string
li $v0,4 #load service number in $v0	
la $a0,result_stringpt1 #load address of string to be printed in $a0
syscall
#print the age
li $v0,1 #load service number in $v0	
move $a0,$t2 #move address in $t2 to $a0 to be printed
syscall
#print the second part of the age string
li $v0,4 #load service number in $v0	
la $a0,result_stringpt2 #load address of string to be printed in $a0
syscall

# the null-terminated string must be defined in data segment
.data
prompt_name: .asciiz "What is your name? "
name: .space 50
namelength: .word 50
prompt_age: .asciiz "What is your age? "
age: .space 50 
greeting_string: .asciiz "Hello, "
result_stringpt1: .asciiz "You will be "
result_stringpt2: .asciiz " in four years"
##