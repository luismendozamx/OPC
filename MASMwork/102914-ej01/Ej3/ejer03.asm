TITLE ejer03.asm

INCLUDE Irvine32.inc

.DATA
line Byte "Teclee el dato N: ",0
line2 Byte "Teclee la calificacion: ",0
line3 Byte "La calificacion: ",0
line4 Byte " corresponde a: ",0
line5 Byte "Adios",0
mnsj Byte "N debe ser mayor a 0 y menor o igual a 100",0
arrayC SDWORD 100 DUP (?)
n SDWORD ?
aLength SDWORD ?
ceros SDWORD 0
num SDWORD 0

.CODE
main PROC

PideN:	
	MOV EDX, OFFSET line 
	CALL WriteString 
	CALL ReadInt
	CALL Crlf
	
	;IF-THEN 
	;Comprueba que la n introducida sea >=1 y <=100
	MOV n,EAX
	CMP n,0
	JLE Nmal
		CMP n,101
		JGE Nmal
			MOV ECX,n
			INC n			
			MOV EBX,0
			MOV aLength,100
			MOV ESI,OFFSET arrayC			
			JMP L2
	
	;Mensaje que notifica que n debe ser distinta de 0	
	Nmal: 
		MOV EDX, OFFSET mnsj 
		CALL WriteString 
		CALL Crlf
		JMP PideN
		
	L1: 
		LOOP L2
		JMP cambiaESI
	L2:
		MOV EDX, OFFSET line2 
		CALL WriteString 
		CALL ReadInt
		MOV num,EAX
		CMP num,0
		JNZ guarda
			INC ceros
	guarda:
		MOV [ESI],EAX
		ADD ESI,TYPE arrayC	
	JMP L1	

cambiaESI:
	MOV ESI,0
	CALL Crlf
		
inWhile: 
	MOV EAX,arrayC[ESI*4]
	CMP ESI, aLength
	JGE adios
		CMP EAX,59
		JG checaS
			CMP EAX,0
			JNZ noCero
				CMP EBX,ceros
				JGE noCero
					MOV EDX, OFFSET line3
					CALL writeString
					CALL writeInt
					MOV EDX,OFFSET line4
					CALL writeString
					MOV al, 'D'
					CALL writeChar
					CALL Crlf
					INC ESI
					INC EBX
				JMP inWhile
			noCero:
				INC ESI
				CMP EAX,0
				JE inWhile
					MOV EDX,OFFSET line3
					CALL writeString
					CALL writeInt
					MOV EDX,OFFSET line4
					CALL writeString
					MOV al, 'D'
					CALL writeChar
					CALL Crlf
					;JMP inWhile
			JMP inWhile
		
		checaS:
			CMP EAX,74
			JG checaB
				MOV EDX, OFFSET line3
				CALL writeString
				CALL writeInt
				MOV EDX, OFFSET line4
				CALL writeString
				MOV al, 'S'
				CALL writeChar
				CALL Crlf	
				INC ESI
				JMP inWhile
		checaB:
			CMP EAX,89
			JG checaA
				MOV EDX, OFFSET line3
				CALL writeString
				CALL writeInt
				MOV EDX, OFFSET line4
				CALL writeString
				MOV al, 'B'
				CALL writeChar
				CALL Crlf
				INC ESI
				JMP inWhile
		checaA:
				MOV EDX, OFFSET line3
				CALL writeString
				CALL writeInt
				MOV EDX, OFFSET line4
				CALL writeString
				MOV al, 'A'
				CALL writeChar
				CALL Crlf
				INC ESI
				JMP inWhile
				
	adios:
		CALL Crlf
		MOV EDX, OFFSET line5
		CALL writeString
		
	EXIT
	
main ENDP

END main
	
