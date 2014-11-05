TITLE write            (write.asm)

INCLUDE Irvine32.inc

.DATA
	line1  BYTE  "Teclee el dato:", 0
    line2  BYTE  "Resultado:", 0
    line3  BYTE  "Adios", 0


 
.CODE
main PROC
	;CALL Crlf
	MOV  EDX, OFFSET line1
	CALL  WriteString

	CALL Crlf
	MOV  EDX, OFFSET line2
	CALL  WriteString

	CALL Crlf
	MOV  EDX, OFFSET line3
	CALL  WriteString

	EXIT

main ENDP
END main