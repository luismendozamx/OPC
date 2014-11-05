TITLE  ejer03.asm

Comment !
Copy array1 in reverse order into reverse2
Display reverse2 using the SIZEOF, TYPE, and LENGTHOF operators to make the program as flexible as possible with CALL DumpMem.
!

INCLUDE Irvine32.inc
.DATA
array1 DWORD 1,2,3,4,5
reverse2 DWORD 5 DUP(?)

.CODE
main PROC
	;Fill up reverse2
	; instructions
	MOV EAX, array1+16
	MOV reverse2, EAX
	MOV EAX, array1+12
	MOV reverse2+4, EAX
	MOV EAX, array1+8
	MOV reverse2+8, EAX
	MOV EAX, array1+4
	MOV reverse2+12, EAX
	MOV EAX, array1
	MOV reverse2+16, EAX
	;Display the array reverse2
	; instructions
	MOV ESI, offset reverse2
	MOV ECX, 5
	MOV EBX, 4
	CALL	DumpMem

	EXIT
main ENDP

END main