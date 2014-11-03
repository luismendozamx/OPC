TITLE Add and Subtract, Version 2         (AddSub2.asm)

; This program adds and subtracts 32-bit integers
; and stores the sum in a variable.


INCLUDE Irvine32.inc

.DATA
val1     DWORD  10000h
val2     DWORD  40000h
val3     DWORD  20000h
finalVal DWORD  ?

.CODE
main PROC

	MOV EAX,val1	; start with 10000h
	ADD EAX,val2	; add 40000h
	SUB EAX,val3	; subtract 20000h
	MOV finalVal,EAX	; store the result (30000h)
	CALL DumpRegs	; display the registers
	MOV ESI, OFFSET val1	; move val1 pointer to ES1
	MOV ECX, 4
	MOV EBX, 4
	CALL DumpMem

	EXIT
main ENDP
END main