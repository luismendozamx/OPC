TITLE multMN            (multMN.asm)

INCLUDE Irvine32.inc

.DATA
      line1  BYTE  "Teclee el dato M: ", 0
      line2  BYTE  "Teclee el dato N: ", 0
      line3  BYTE  "M*N= ", 0
      line4  BYTE  "Acumulado: ", 0

	 valM  SDWORD ?
	 valN  SDWORD ?

 
.CODE
main PROC
	;pedir datos (m y n)
M:	MOV  EDX, OFFSET line1
	CALL  WriteString		;Teclee el dato M: 
	CALL  ReadInt
	MOV	valM, EAX
	JS M
	JZ W

N:	MOV  EDX, OFFSET line2
	CALL  WriteString		;Teclee el dato N:
	CALL  ReadInt
	MOV	valN, EAX
	JS N
	JZ Y
	MOV EAX, valN
	SUB EAX, valM
	JNS X
	
	MOV EAX, valN
	XCHG EAX, valM
	XCHG EAX, valN
	
X:	MOV   ECX,valM
	MOV EAX,0
	MOV EDX, OFFSET line4

	;ciclo de duracion M
L1:	CALL Crlf
	CALL WriteString
	ADD EAX, valN
	CALL WriteInt
	LOOP L1
Y:	
	CALL Crlf
	MOV  EDX, OFFSET line3
	CALL  WriteString		;"M*N= "
	CALL  WriteInt
	JMP Z
W:	MOV  EDX, OFFSET line2
	CALL  WriteString		;Teclee el dato N:
	CALL  ReadInt
	MOV	EAX,0
	JMP Y
Z:
	EXIT

main ENDP
END main
