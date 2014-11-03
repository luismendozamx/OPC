TITLE eje1            (eje4.asm)

INCLUDE Irvine32.inc

.DATA
	line1  BYTE  "Teclee el dato:", 0
	line2  BYTE  "Resultado:", 0
	line4  BYTE  "hex:", 0
	line3  BYTE  "Adios", 0
	
lineS  BYTE   0Ah,0Dh, 0


	 valInt  SDWORD ?


 
.CODE
main PROC
	MOV  EDX, OFFSET lineS
	CALL  WriteString

	MOV  EDX, OFFSET line1
	CALL  WriteString
	CALL  ReadInt


	MOV  EDX, OFFSET line2
	CALL  WriteString
	ADD EAX,5
	CALL  WriteInt

	MOV  EDX, OFFSET lineS
	CALL  WriteString

	MOV  EDX, OFFSET line4
	CALL  WriteString
	SUB EAX,3
	CALL  WriteHex

	MOV  EDX, OFFSET lineS
	CALL  WriteString

	MOV  EDX, OFFSET line3
	CALL  WriteString
	

	EXIT

main ENDP
END main