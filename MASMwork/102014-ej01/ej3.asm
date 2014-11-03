TITLE Ejercicio 3             (ej3.asm)

; This program adds and subtracts 32-bit integers.


INCLUDE Irvine32.inc

.DATA

line1 BYTE  "Teclee el dato N: ",0 
line2 BYTE  "Resultado: ",0 
line3 BYTE  "Adios",0 
line4 BYTE  "Teclee el nuevo salario: ",0
line5 BYTE  "Teclee el anterior salario: ",0
line6 BYTE  "Diferencia: ",0
res1   DWORD 0 ;suma salarios nuevo
res2   DWORD 0 ;suma salarios viejos
aux	   DWORD 0 ;dif instantanea de salarios




.CODE
main PROC
	MOV   EDX, OFFSET line1
	CALL  WriteString
	CALL  ReadInt

	MOV   ECX,EAX	
L1:
		MOV   EDX, OFFSET line4	
		CALL  WriteString
		CALL  ReadInt
		ADD   res1,EAX
		MOV   aux,EAX

		MOV   EDX, OFFSET line5
		CALL  WriteString
		CALL  ReadInt
		ADD   res2,EAX

		MOV   EDX, OFFSET line6
		CALL  WriteString
		SUB   aux,EAX
		MOV   EAX,aux
		CALL  WriteInt
		CALL Crlf

	loop L1

	MOV   EDX, OFFSET line2
	CALL  WriteString
	MOV   EAX,res1
	CALL  WriteInt
	CALL Crlf

	MOV   EDX, OFFSET line2
	CALL  WriteString
	MOV   EAX,res2
	CALL  WriteInt
	CALL Crlf

	MOV   EDX, OFFSET line2
	CALL  WriteString
	MOV   EAX,res1
	SUB   EAX,res2
	CALL  WriteInt
	CALL Crlf

	MOV   EDX, OFFSET line3
	CALL  WriteString


	EXIT
main ENDP
END main