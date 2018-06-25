#InputRecord.asm - takes series of inputrecord
#Display input at certain position starting from 0
#if the formula exists, else returns user input

#Simphiwe Mchunu
#28 October 2017

.data

	inputrecord: .space 26 # allocates 25 byte character
	char: .asciiz "="
	cell0:	.asciiz "0"
	cell1: 	.asciiz "1"
	cell2: 	.asciiz "2"
	cell3: 	.asciiz "3"
	inmessage:	.asciiz "Enter a series of 5 formulae:\n"
	outmessage:  .asciiz "The values are:\n"

.text
	.globl main
		main:

			la $s0, 0
			la $s2, 0
			li $s3, 0

			#program counter
			li $s4, 5
			li $v0, 4

			#display inmessage
			la $a0, inmessage
			syscall



	manipulation:

		move $t2,$s0
		addi $t2,$t2,1
		lb $t7, cell0
		lb $t4, cell1
		lb $t5, cell2
		lb $t6, cell3

		lb $t3, inputrecord($t2)
		beq $t3,$t7, cell0Ref
		beq $t3,$t4, cell1Ref
		beq $t3,$t5, cell2Ref
		beq $t3,$t6, cell3Ref

		b userinput

	cell0Ref:

		li $t6, 0
		lw $t5, inputrecord($t6)
		sw $t5, inputrecord($s0)
		addi $s3, $s3, 1
		addi $s0, $s0, 4

		b userinput

	cell1Ref:

		li $t6, 4
		lw $t5, inputrecord($t6)
		sw $t5, inputrecord($s0)
		addi $s3, $s3, 1
		addi $s0, $s0, 4

		b userinput

	cell2Ref:

		li $t6, 8
		lw $t5, inputrecord($t6)
		sw $t5, inputrecord($s0)

		addi $s3, $s3, 1
		addi $s0, $s0, 4

		b userinput

	cell3Ref:
		li $t6, 12
		lw $t5, inputrecord($t6)
		sw $t5, inputrecord($s0)
		addi $s3, $s3, 1
		addi $s0, $s0, 4
		b userinput


	userinput:

		beq $s3, $s4, complete

		#userinput
		li $v0,8
		la $a0,inputrecord($s0)
		syscall

		lb $t0,inputrecord($s0)
		lb $t1,char


		beq $t0,$t1, manipulation

		addi $s3, $s3, 1
		addi $s0, $s0, 4

		b userinput


	complete:

		#initialize program counter
		li $s3, 0

		#Display outmessage
		li $v0,4
		la $a0, outmessage
		syscall

	results:

		#Results tag

		li $v0,4
		la $a0, inputrecord($s2)
		syscall

		addi $s3, $s3, 1
		addi $s2, $s2, 4

		bne $s3,$s4, results

		jr $ra
