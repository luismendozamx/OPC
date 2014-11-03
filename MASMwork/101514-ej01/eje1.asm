TITLE eje1            (eje1.asm)

INCLUDE Irvine32.inc

.DATA
      line1  BYTE  "Teclee el dato:", 0
      line2  BYTE  "Resultado:", 0
      line3  BYTE  "Adios", 0
	line4  BYTE  "hex:", 0
lineS  BYTE  0Dh, 0

	 valInt  SDWORD ?


 
.CODE
main PROC
	CALL Crlf
	MOV  EDX, OFFSET line1
	CALL  WriteString
	CALL  ReadInt

	MOV  EDX, OFFSET line2
	CALL  WriteString
	ADD EAX,5
	CALL  WriteInt

	CALL Crlf
	MOV  EDX, OFFSET line4
	CALL  WriteString
	SUB EAX,3
	CALL  WriteHex

	CALL Crlf
	MOV  EDX, OFFSET line3
	CALL  WriteString
	

	EXIT

main ENDP
END main