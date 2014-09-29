TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.


INCLUDE Irvine32.inc

.CODE
main PROC

	MOV EAX,10000h		; EAX = 10000h
	ADD EAX,40000h		; EAX = 50000h
	SUB EAX,20000h		; EAX = 30000h
	CALL DumpRegs

	EXIT

main ENDP
END main