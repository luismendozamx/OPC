TITLE Add and Subtract, Version 2         (AddSub2.asm)

; This program adds and subtracts 32-bit integers
; anad stores the sum in a variable.


INCLUDE Irvine32.inc

.DATA

arrayD DWORD 1,2,3

.CODE
main PROC

	MOV EAX, arrayD
	XCHG EAX, arrayD+1
	XCHG EAX, arrayD+2
	MOV arrayD, EAX
	CALL DumpRegs			; display the registers
	MOV ESI, OFFSET arrayD	; move val1 pointer to ES1
	MOV ECX, 3			; 4 simbolos a leer
	MOV EBX, 4			; cada uno de longitud 4 bytes
	CALL DumpMem

	EXIT
main ENDP
END main