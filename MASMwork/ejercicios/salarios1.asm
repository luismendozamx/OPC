TITLE salario1            (salario1.asm)

INCLUDE Irvine32.inc

.DATA
	line1  BYTE  "Teclee el dato n:", 0
	line2  BYTE  "Teclee el primer nuevo salario:", 0
	line3  BYTE  "Teclee el siguiente nuevo salario:", 0
    line4  BYTE  "Resultado:", 0
    line5  BYTE  "Adios", 0
    res    DWORD 0


 
.CODE
main PROC
	CALL Crlf
	MOV  EDX, OFFSET line1
	CALL  WriteString
	CALL ReadInt

	MOV ECX, EAX
	MOV  EDX, OFFSET line2
	CALL  WriteString
	CALL ReadInt
	ADD res, EAX
	DEC ECX

L1:
	MOV  EDX, OFFSET line3
	CALL  WriteString
	CALL ReadInt
	ADD res, EAX
	LOOP L1

	CALL Crlf
	MOV  EDX, OFFSET line4
	CALL  WriteString
	MOV EAX, res
	CALL WriteInt

	CALL Crlf

	CALL DumpRegs

	MOV ESI, OFFSET res
	MOV ECX, 1
	MOV EBX, 4
	CALL DumpMem

	EXIT

main ENDP
END main