TITLE  ejer02.asm

Comment !
Description: Write a program that implements the following
arithmetic expression:
	EAX = -val2 + 7 - val3 + val1

In comments next to each instruction, write the hexadecimal value
of EAX. Insert a call DumpRegs statement at the end of the program.
Recall the prcedence order of the operators in the translation.
!

INCLUDE Irvine32.inc

.DATA
val1 SDWORD 8
val2 SDWORD -15
val3 SDWORD 20

.CODE
main PROC
	; EAX = -val2 + 7 - val3 + val1
	; instructions
	MOV EAX, val2
	NEG EAX
	ADD EAX, 7
	;MOV EBX, val3
	;MOV ECX, val1
	SUB EAX, val3
	ADD EAX, val1
	CALL	DumpRegs

	EXIT
main ENDP

END main