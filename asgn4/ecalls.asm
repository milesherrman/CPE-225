	.globl printString printInt readInt readChar exitProg
	
	.text 
printString:
	li a7, 4
	ecall
	jalr zero, 0(ra)

printInt:
	li a7, 1
	ecall
	jalr zero, 0(ra)

readInt:
	li a7, 5
	ecall
	jalr zero, 0(ra)

readChar:
	li a7, 12
	ecall
	jalr zero, 0(ra)
exitProg: 
	li a7, 10
	ecall
	
