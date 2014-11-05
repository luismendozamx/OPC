TITLE writeadd            (writeadd.asm)

INCLUDE Irvine32.inc

.DATA
	line1  BYTE  "Teclee el dato:", 0
    line2  BYTE  "Resultado(+5):", 0
    line4  BYTE  "Resultado HEX(+5):", 0
    line3  BYTE  "Adios", 0
    res BYTE ?

 
.CODE
main PROC
	CALL Crlf
	MOV  EDX, OFFSET line1
	CALL  WriteString
	CALL ReadInt

	MOV  EDX, OFFSET line2
	CALL  WriteString
	ADD EAX, 5
	CALL WriteInt

	CALL Crlf
	MOV EDX, offset line4
	CALL WriteString
	CALL WriteHex

	CALL Crlf
	MOV  EDX, OFFSET line3
	CALL  WriteString

	EXIT

main ENDP
END main