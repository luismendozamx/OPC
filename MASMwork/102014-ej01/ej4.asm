TITLE Ejercicio 4             (ej4.asm)

; This program adds and subtracts 32-bit integers.


INCLUDE Irvine32.inc

.DATA



val1   DWORD 0
val2   DWORD 1


.CODE
main PROC

	MOV   ECX,11	
	MOV   EAX,val1
	CALL  WriteInt
	CALL Crlf
L1:
		MOV   EAX,val2
		CALL  WriteInt
		CALL Crlf
		MOV   EBX,val2
		MOV   EDX,val1
		ADD   val2,EDX
		MOV   val1,EBX
	loop L1


	EXIT
main ENDP
END main