#PrintIt.asm - takes series of input and displays them
#Simphiwe Mchunu
#28 October 2017


.data
	inmessage: .asciiz "Enter a series of 5 formulae:\n"
	outmessage: .asciiz "The values are:\n"
	input1: .space 6
	input2: .space 6
	input3: .space 6
	input4: .space 6
	input5: .space 6


.text
	.globl main
	main:

	li $v0, 4
	la $a0, inmessage
	syscall

	#first prompt

	li $v0, 8
	la $a0, input1
	li $a1, 6
	syscall

	#second prompt
	li $v0, 8
	la $a0, input2
	li $a1, 6
	syscall

	#third prompt
	li $v0, 8
	la $a0, input3
	li $a1, 6
	syscall

	#fourth prompt
	li $v0, 8
	la $a0, input4
	li $a1, 6
	syscall

	#last prompt
	li $v0,8
	la $a0, input5
	li $a1, 6

	syscall



	#display outmessage
	li $v0, 4
	la $a0, outmessage
	syscall

	#display first input
	li $v0, 4
	la $a0, input1
	syscall

	#display second input
	li $v0, 4
	la $a0, input2
	syscall

	#display third input
	li $v0, 4
	la $a0, input3
	syscall

	#display fourth input
	li $v0, 4
	la $a0, input4
	syscall

	#display last input
	li $v0, 4
	la $a0, input5
	syscall




	#exit main
	li $v0, 10
	syscall
