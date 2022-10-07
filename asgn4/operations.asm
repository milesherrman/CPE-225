	.globl addOP subOP mulOP divOP andOP orOP xorOP lshiftOP rshiftOP
	
	.text 
addOP:
	add a0, a0, a1
	jalr zero, 0(ra)
subOP:
	sub a0, a0, a1
	jalr zero, 0(ra)
mulOP:
	mul a0, a0, a1
	jalr zero, 0(ra)
divOP:
	div a0, a0, a1
	jalr zero, 0(ra)
andOP:
	and a0, a0, a1
	jalr zero, 0(ra)
orOP:
	or a0, a0, a1
	jalr zero, 0(ra)
xorOP: 
	xor a0, a0, a1
	jalr zero, 0(ra)
lshiftOP: 
	sll a0, a0, a1
	jalr zero, 0(ra)
rshiftOP:
	srl a0, a0, a1
	jalr zero, 0(ra)
