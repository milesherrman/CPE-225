	.globl return

	.text 
start:
	#Load "Welcome..." into a0
	la a0, prompt1
	#jump to printString subroutine
	jal ra, printString
	#begin while loop
	while_loop:
		#Load "Enter Number" into a0
		la a0, prompt2
		#jump to printString subroutine
		jal ra, printString
		##jump to readInt subroutine
		jal ra, readInt
		#Store user input (number 1) into t0
		mv t0, a0
		#Load "Enter Second Number" into a0
		la a0, prompt3
		#jump to printString subroutine
		jal ra, printString
		#jump to readInt subroutine
		jal ra, readInt
		#Store user input (number 1) into t0
		mv t1, a0
	
		#Print prompt 4
		la a0, prompt4
		#Load syscall 4 into a7
		li a7, 4
		#jump to printString subroutine
		jal ra, printString
		#jump to readInt subroutine
		jal ra, readInt
		#Store user input (operation) into t2
		mv t2, a0
		#Set t3 to 9 to check operation within bounds
		li t3, 9
		#Set t4 to 1 (operation checker)
		mv t4, zero
	
		#begin if else block
			#check if operation is less than or equal to 0
			blez  t2, invalid
			#check if operation is greater than 9
			bgt t2, t3, invalid
			#set a0 and a1 to given numbers
			mv a0, t0
			mv a1, t1
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next1
			#Jump to operation if equal
			jal ra, addOP
		next1: 
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next2
			#Jump to operation if equal
			jal ra, subOP
		next2: 
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next3
			#Jump to operation if equal
			jal ra, mulOP
			
		next3: 
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next4
			#Jump to operation if equal
			jal ra, divOP
		next4: 
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next5
			#Jump to operation if equal
			jal ra, andOP
		next5: 
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next6
			#Jump to operation if equal
			jal ra, orOP
		next6: 
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next7
			#Jump to operation if equal
			jal ra, xorOP
		next7: 
			#Increment t4 (operation checker)
			addi t4, t4, 1
			#Check if operation = 1
			bne  t2, t4, next8
			#Jump to operation if equal
			jal ra, lshiftOP
		next8: 
			bne  t2, t4, return 
			#Jump to operation if all else are false
			jal ra, rshiftOP
return:
		#set t0 to result of operation
		mv t0, a0
		#Load "Result: into a0
		la a0, prompt5
		#jump to printString subroutine
		jal ra, printString
		#Load result into a0
		mv a0, t0
		#Load syscall 1 into a7
		li a7, 1
		#Print result
		ecall
		j continue
invalid:	#Load "result: invalid.." into a0
		la a0, prompt6
		#jump to printString subroutine
		jal ra, printString
		
continue:	#Load "Continue.." into a0
		la a0, prompt7
		#jump to printString subroutine
		jal ra, printString
		#jump to readChar subroutine
		jal ra, readChar
		#Store user input in t5
		mv t5, a0
		#Set t6 to n
		li t6, 'n'
		# check if input was 'n', exit if true
		beq t6, t5, end_while
		#jump to top of while loop
		j while_loop
	#end while loop label
	end_while:
	#Load "Exiting into a0
	la a0, prompt8
	#jump to printString subroutine
	jal ra, printString
	#jump to exitProg subroutine
	jal ra, exitProg
	
.data
prompt1: .string "Welcome to the Calculator program.\nOperations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7: xor 8:lshift 9:rshift"
prompt2: .string "\n\nEnter number: "
prompt3: .string "Enter second number: "
prompt4: .string "Select operation: "
prompt5: .string "Result: "
prompt6: .string "Result: Invalid Operation"
prompt7: .string "\nContinue (y/n)?: "
prompt8: .string "\nExiting\n"
