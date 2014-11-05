TITLE Ejercicio 1             (ej1.asm)

; This program adds and subtracts 32-bit integers.


INCLUDE Irvine32.inc

.DATA

line1 BYTE  "Teclee el dato N: ",0 
line2 BYTE  "Resultado: ",0 
line3 BYTE  "Adios",0 
line4 BYTE  "Teclee el ",0
line6 BYTE  " salario: ",0
line5 BYTE  "MAYOR: ",0
res   DWORD 0
mayor DWORD 0
cont  DWORD 1



.CODE
main PROC
N:	
	MOV   EDX, OFFSET line1
	CALL  WriteString
	CALL  ReadInt

	MOV   ECX,EAX
	JS N
	JZ N

L1:
	MOV   EDX, OFFSET line4	
	CALL  WriteString
	MOV	EAX,cont
	CALL WriteInt
	MOV   EDX, OFFSET line6	
	CALL  WriteString
	CALL  ReadInt
	ADD   res,EAX


	CMP   EAX,mayor
	JNA    X
	MOV mayor,EAX

X:	
	INC cont
	loop L1

	MOV   EDX, OFFSET line2
	CALL  WriteString
	MOV   EAX,res
	CALL  WriteInt
	CALL Crlf

	MOV   EDX, OFFSET line5
	CALL  WriteString
	MOV   EAX,mayor
	CALL  WriteInt
	CALL Crlf

	MOV   EDX, OFFSET line3
	CALL  WriteString


	EXIT
main ENDP
END main