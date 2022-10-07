	#.globl main

	.text 
start:
	#Load prompt into a0
	la a0, prompt1
	#Load syscall 4 into a7
	li a7, 4
	#Print "Welcome to the CountOnes Program."
	ecall
	#Set t0 = 0, unchanging
	li t0, 0 
	#Set t1 = 1, unchanging
	li t1, 1 
#Start first while loop
while_loop1:
	#Load prompt into a0
	la a0, prompt2
	#Load syscall 4 into a7
	li a7, 4
	#Print "Please enter a number: "
	ecall
	#Load syscall 5 into a7
	li a7, 5
	#Take user input (int)
	ecall
	#Store user input (current number) into t2
	mv t2, a0
	#set t5 to bit counter (0)
	li t5, 0
	#set t6 as test value (1)
	li t6, 1


	#Set second while loop condition
	li t3, 32   # t3 = 32
   	#Start second while loop to check bits
   	whileloop2:
   		#exit inner while loop after 32 loops
   		beq  t3,t0, exit2
   		#set t4 as AND of input and test value
		and t4 t2, t6
		#"left shift" value
		slli t6, t6, 1
		#Check if AND value is > 0 
		beqz t4, nobit #jump to nobit if true
		#increment bit counter
		addi t5, t5, 1
		nobit:
   		#decrement t2
   		addi t3, t3, -1
   		#jump to top of while loop
   		j whileloop2
	exit2:
   	
   	
   	#Load prompt into a0
   	la a0, prompt3
   	#Load syscall 4 into a7
	li a7, 4
	#Print "The number of bits set is: "
	ecall
	#Set a0 to bit counter (t5)
	addi  a0, t5, 0
	#Load syscall 1 into a7
	li a7, 1
	#Print bit count
	ecall
	#Load prompt into a0
	la a0, prompt4
	#Load syscall 4 into a7
	li a7, 4
	#Print "Continue (y/n)?: "
	ecall 
	#Load syscall 12 into a7
	li a7, 12
	#Take user input (char)
	ecall
	#Store user input in t5
	mv t5, a0
	li t4, 'n'
	# check if input was 'n', exit if true
	beq t5, t4, exit1 
   	#jump to top of while loop
   	j while_loop1
#end of while loop
exit1:
	
	#Load prompt into a0
	la a0, prompt5
	#Load syscall 4 into a7
	li a7, 4
	#Print "Exiting"
	ecall
	#Load syscall 10 into a7
	li a7, 10
	#Exit program
	ecall

.data
prompt1: .string "Welcome to the CountOnes program."
prompt2: .string "\n\nPlease enter a number: "
prompt3: .string "The number of bits set is: "
prompt4: .string "\nContinue (y/n)?: "
prompt5: .string "\nExiting\n"
