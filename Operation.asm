#Operation.asm - takes a string, convert to int then add 5
#Simphiwe Mchunu
#28 October 2017



.data
   userinput: .space 9
   inmessage: .asciiz "Enter a string:\n"
   outmessage: .asciiz "The value +5 is:\n"

.text
.globl main

main:
	# Display inmessage
	li $v0, 4
	la $a0, inmessage
	syscall

	#prompts user
   li $v0, 8
   la $a0, userinput        #load userimput into $a0
   move $t0, $a0			#store the value to $t0
   syscall

   li $t3,0
   li $t4,9
   la $t0, userinput
   lbu $t1, 1($t0)
   li $a1, 10
   li $a0, 0
   addi $t1,$t1,-48
   move $a2, $t1
   add $a0, $a0, $t1      #Accumulates value at $a0
   addi $t0, $t0, 1
   lbu $t1, 1($t0)

   #loops until string digit is complete => skips first non- alpha character
   #convert from ASCII to digit
while:
   beq $t1, $a1, exit #termination condition
   addi $t1,$t1,-48  #Convert to digit
   move $a2, $t1         #store in $a2
   mul $t2, $a0, 10  #Multiply by 10
   add $a0, $t2, $t1      #Accumulates value at $a0
   addi $t0, $t0, 1      #update string pointer
   lbu $t1, 1($t0)        #Get next digit
   j while

exit:

	move $t4, $a0

	#display output messagee
	li $v0, 4
	la $a0, outmessage
	syscall

	#Display results
	add $a0, $t4, 5
	li $v0, 1
	syscall

	#exit main
	li $v0, 10
	syscall
