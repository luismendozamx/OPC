TITLE salario1            (salario1.asm)

INCLUDE Irvine32.inc

.DATA
	line1  BYTE  "Serie de Fibonacci (12)", 0
	line2  BYTE  "FIN", 0
    primero DWORD 0
    segundo DWORD 1
 
.CODE
main PROC
	CALL Crlf
	MOV  EDX, OFFSET line1
	CALL  WriteString

	CALL Crlf
	CALL Crlf
	MOV EAX, primero
	CALL WriteInt

	CALL Crlf
	MOV EAX, segundo
	CALL WriteInt
	CALL Crlf

	MOV ECX, 9
L1:
	MOV EAX, primero
	ADD EAX, segundo
	CALL WriteInt
	CALL Crlf
	MOV EBX, segundo
	MOV primero, EBX
	MOV segundo, EAX
	LOOP L1

	CALL Crlf
	MOV  EDX, OFFSET line2
	CALL  WriteString

	CALL Crlf

	CALL DumpRegs

	MOV ESI, OFFSET primero
	MOV ECX, 2
	MOV EBX, 4
	CALL DumpMem

	EXIT

main ENDP
END main