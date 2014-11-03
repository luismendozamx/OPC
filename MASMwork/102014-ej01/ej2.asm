TITLE Ejercicio 2             (ej2.asm)

; This program adds and subtracts 32-bit integers.


INCLUDE Irvine32.inc

.DATA

line1 BYTE  "Teclee el dato N: ",0 
line2 BYTE  "Resultado: ",0 
line3 BYTE  "Adios",0 
line4 BYTE  "Teclee el nuevo salario: ",0

res   DWORD 0




.CODE
main PROC
	MOV   EDX, OFFSET line1
	CALL  WriteString
	CALL  ReadInt

	MOV   ECX,EAX	

T1:
		loop  T2
		JMP   T3
T2:
		MOV   EDX, OFFSET line4	
		CALL  WriteString
		CALL  ReadInt
		ADD   res,EAX
		
		JMP T1
T3:

	MOV   EDX, OFFSET line2
	CALL  WriteString
	MOV   EAX,res
	CALL  WriteInt
	CALL Crlf

	MOV   EDX, OFFSET line3
	CALL  WriteString


	EXIT
main ENDP
END main