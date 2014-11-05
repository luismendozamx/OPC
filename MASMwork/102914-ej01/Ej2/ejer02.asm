TITLE  ejer02.asm

INCLUDE Irvine32.inc
.DATA
line Byte "Teclee el dato N: ",0
line2 Byte "Teclee la ",0
line2a Byte " temperatura: ",0
line3 Byte "La temperatura ",0
line3a Byte " es: ",0
line4 BYTE "Adios",0
mnsj Byte "N debe ser mayor o igual a 1 y menor o igual a 20",0
n SDWORD ?
num SDWORD 1
arrayT SDWORD 20 DUP (?)
indexI SDWORD 0
indexJ SDWORD 1
first SDWORD ?
temp SDWORD ?
menor SDWORD ?
aLength SDWORD ?
aLength2 SDWORD ?
pos SDWORD ?
ceros SDWORD 0

.CODE
main PROC
	
PideN:	
	MOV ESI, OFFSET arrayT	
	MOV EDX, OFFSET line 
	CALL WriteString 
	CALL ReadInt
	CALL Crlf
	
	;IF-THEN 
	;Comprueba que la n introducida sea >=1 y <=20
	MOV n,EAX
	CMP n,0
	JLE Nmal
		CMP n,21
		JGE Nmal
			MOV ECX,n
			INC n			
			MOV EBX,0
			JMP L2 
	
	;Mensaje que notifica que n debe ser distinta de 0	
	Nmal: 
		MOV EDX, OFFSET mnsj 
		CALL WriteString 
		CALL Crlf
		JMP PideN
		
	L1: 
		LOOP L2
		JMP L3
	L2:
		MOV EDX, OFFSET line2 
		CALL WriteString 
		MOV EAX,num
		CALL WriteInt
		MOV EDX, OFFSET line2a 
		CALL WriteString
		INC num
		CALL ReadInt
		
		CMP EAX,0
		JNZ guarda
			INC ceros
	guarda:
		MOV [ESI],EAX
		ADD ESI,TYPE arrayT
		
		JMP L1
		
	L3:
	MOV ESI,LENGTHOF arrayT
	MOV aLength,ESI
	MOV aLength2,ESI
	DEC aLength
	MOV EAX,indexI ;i es EAX
	MOV ECX,indexJ ;j es ECX

	inWhile:
		CMP EAX, aLength ;for(i=0; i<A.length-1;i++
		JGE outWHILE		
			MOV EBX, arrayT[EAX*4] ;EBX = A[i]
			MOV menor,EBX
			MOV pos,EAX
		
			INC EAX
			MOV ECX,EAX
			DEC EAX
	
		inWhile2: ;for (j=i+1;j<A.length;j++
				CMP ECX,aLength2 ;j<A.length
				JGE outWhile2 
					MOV EDX, arrayT[ECX*4] ;EDX = A[j]
					CMP EDX,menor
					JGE outIF
						MOV menor,EDX
						MOV pos,ECX
					outIF:
					INC ECX ;j++
					JMP inWhile2
				outWhile2:
					CMP pos, EAX ;if (pos!=i)
					JE outIF2 
						MOV temp,EBX ;tmp = A[i]
						MOV ESI,pos
						MOV EDI,arrayT[ESI*4]
						MOV arrayT[EAX*4],EDI ;A[i]=A[pos]
						MOV EDI,temp
						MOV arrayT[ESI*4],EDI ;A[pos] = temp 
					outIF2:	
					INC EAX
					JMP inWhile
		outWHILE:
			MOV EBX,0 ;contador recorre todo
			MOV ECX,0 ;Contador para ceros
			MOV num,0 ;Contador de terminos
			CALL Crlf
	
		whileIMP:
			CMP EBX,aLength2
			JGE adios
				MOV EAX,arrayT[EBX*4]
				CMP EAX,0
				JNZ noCero
					CMP ECX,ceros
					JGE finCeros
						INC num
						MOV EDX,OFFSET line3
						CALL writeString
						MOV ESI,EAX
						MOV EAX,num
						CALL writeInt
						MOV EDX, OFFSET line3a
						CALL writeString
						MOV EAX,ESI
						CALL writeInt
						CALL Crlf
						INC ECX
						INC EBX
						JMP whileIMP
					finCeros:
						INC EBX
						CMP EAX,0
						JE whileIMP
							INC num
							MOV EDX,OFFSET line3
							CALL writeString
							MOV ESI,EAX
							MOV EAX,num
							CALL writeInt
							MOV EDX, OFFSET line3a
							CALL writeString
							MOV EAX,ESI
							CALL writeInt
							CALL Crlf
							JMP whileIMP							
				noCero:
					inc num
					MOV EDX,OFFSET line3
					CALL writeString
					MOV ESI,EAX
					MOV EAX,num
					CALL writeInt
					MOV EDX, OFFSET line3a
					CALL writeString
					MOV EAX,ESI
					CALL writeInt
					CALL Crlf
					INC EBX
				JMP whileIMP
	adios:
	
	MOV EDX, OFFSET line4 
	CALL WriteString
	
	EXIT
main ENDP

END main