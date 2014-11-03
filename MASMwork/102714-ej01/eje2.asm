TITLE eje2           (eje2.asm)

INCLUDE Irvine32.inc

.DATA
      line1  BYTE  "Teclee el dato N: ", 0
      line2  BYTE  "Termino ", 0
      line3  BYTE  "TOTAL:", 0
      line4  BYTE  ": ", 0
      line5  BYTE  "           ", 0

	 sig  SDWORD -1
	total  SDWORD 0
	val	SDWORD 3
	num     SDWORD 0
	aux     SDWORD 0


 
.CODE
main PROC
	;PEDIR VALOR DE N
	CALL Crlf
	MOV  EDX, OFFSET line1
	CALL  WriteString	;"Teclee el dato N: "
	CALL  ReadInt

	
	;CICLO
	MOV   aux,EAX	

L1:	MOV  EDX, OFFSET line2 
	CALL  WriteString 	;"siguiente termino:"
	ADD   num,1 
	MOV EAX,num
	CALL  WriteInt

	MOV  EDX, OFFSET line4 
	CALL  WriteString 
	
	MOV EAX, sig
	CALL  WriteInt		;Valor del termino que se suma

	MOV  EDX, OFFSET line5 
	CALL  WriteString 

	TEST  ECX,1b
	JZ   S1		;si es non brinca
	CALL Crlf
S1:
	ADD total,EAX
	NEG EAX			;Negar el ultimo termino sumado
	ADD EAX, val		;aumentar la magnitud del numero sumado en 3
	MOV sig, EAX
	NEG val			;alternar el signo del 3 para poder sumar
	
	
	CMP   aux,0
	JG    L1
	
	CALL Crlf
	MOV  EDX, OFFSET line3
	CALL  WriteString
	MOV EAX, total
	CALL  WriteInt
	

	EXIT

main ENDP
END main