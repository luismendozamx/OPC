TITLE Add and Subtract, Version 2         (AddSub2.asm)

; This program adds and subtracts 32-bit integers
; and stores the sum in a variable.


INCLUDE Irvine32.inc

.DATA

inicio = $
val1     DWORD  10000h
tamano = ($ - inicio)
val2     DWORD  40000h
val3     DWORD  20000h
finalVal DWORD  ?
cuenta = ($ - inicio) / tamano


.CODE
main PROC

	MOV EAX,val1			; start with 10000h
	ADD EAX,val2			; add 40000h
	SUB EAX,val3			; subtract 20000h
	MOV finalVal,EAX		; store the result (30000h)
	CALL DumpRegs			; display the registers
	MOV ESI, OFFSET val1	; move val1 pointer to ES1
	MOV ECX, cuenta			; 4 simbolos a leer
	MOV EBX, tamano			; cada uno de longitud 4 bytes
	CALL DumpMem

	EXIT
main ENDP
END main