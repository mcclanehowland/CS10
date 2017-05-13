la $t3, note_array         # put address of list into $t3
li $a1,100 #duration
li $a2,0 #instrument
li $a3,127 #volume
li $v0,33 #set syscall to type 33, which is "MIDI out synchronous"

li $t0,20 #for loop limit, 
li $t1,0 #for loop increment variable
loop:
beq $t1,$t0,end #if $t0 == $t1 end the loop
#loop body
la $t2,($t1) #copy the counter into the index
add $t2, $t2, $t2
add $t2, $t2, $t2 #index now a multiple of 4, bc added together twice
add $t4,$t2,$t3 #add index and array
lw $t5,0($t4) #retrieve the value from the array
move $a0,$t5 #move the retrieved value into the output register
syscall
#increment $t1
addi $t1,$t1,1 #incrememt $t1
j loop #jump back to the top
end:

#data segment
.data
note_array: .word 60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80
