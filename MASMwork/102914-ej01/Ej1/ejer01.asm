TITLE ejer01.asm

INCLUDE Irvine32.inc
.DATA

arrayI SDWORD 10,60,20,33,72,89,45,65,72,18
sample SDWORD 50
arraySize SDWORD ?
index SDWORD 0
sum SDWORD 0
divisor SDWORD ?
line Byte "SUMA: ",0
line2 Byte "Adios",0

.CODE
main PROC
	
	MOV EAX,SIZEOF arrayI
	MOV EDX,0
	MOV ECX,SIZEOF sample
	MOV divisor, ECX
	DIV divisor
	MOV arraySize,EAX
	MOV ECX,sum
		
inWhile:
	MOV ESI,index
	CMP ESI,arraySize
	JGE outWhile ;Jump si index>=arraySize
		MOV EBX,arrayI[ESI*4]
		CMP EBX,sample
		JG outIF ;Jump si array[index]>sample
			ADD ECX,arrayI[ESI*4]
	outIF:
		INC index
	JMP inWhile

outWhile:	
	
	MOV EDX, OFFSET line
	CALL WriteString
	
	MOV EAX,ECX
	CALL writeInt
	
	CALL Crlf
	
	MOV EDX, OFFSET line2
	CALL WriteString

	EXIT
main ENDP

END main