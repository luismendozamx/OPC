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

	CALL DumpRegs

	EXIT

main ENDP
END main