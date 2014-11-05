TITLE Add and Subtract, Version 2         (AddSub2.asm)

; This program adds and subtracts 32-bit integers
; anad stores the sum in a variable.


INCLUDE Irvine32.inc

.DATA

var1 DWORD 10000h
var2 DWORD 20000h

.CODE
main PROC

	MOV EAX, var1
	ADD EAX, var2
	ADD AX, 0FFFFh
	ADD EAX, 1
	SUB AX, 1
	CALL DumpRegs

	EXIT
main ENDP
END main