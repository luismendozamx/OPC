TITLE Program Template          (RevStr.asm)

INCLUDE Irvine32.inc

.data
texto BYTE "Teclee el valor de n: ", 0
textoa BYTE "Teclee el valor de m: ", 0
adios Byte "ADIOS",0
texto2 BYTE "Potencia 2,",0
texto2a BYTE " peso: ",0
mult DWORD ?
nVal SDWORD ?	
mVal SDWORD ?
buffer BYTE 32 dup(0),0
unos BYTE 32 dup(0),0
index DWORD 0
numUnos DWORD 0
Recorridos DWORD 32 dup(0)


.code
main PROC
	;Procedimiento Principal	
		
	MOV EDX, OFFSET texto
	CALL WriteString ;teclee el valor de n
	CALL ReadInt
	CALL Crlf
	
	MOV nVal ,EAX ;primer numero que mete el usuario
	
	MOV EDX, OFFSET textoa
	CALL WriteString ;teclee el valor de m
	CALL ReadInt
	CALL Crlf
	
	MOV mVal, EAX
	MOV EAX,nVal
	CMP EAX, mVal
	JNA L2
		MOV EBX, EAX
		MOV EAX,mVal
		MOV nVal, EAX
		MOV mVal,EBX
	L2:	
	;nVal es el menor
	
	CALL multiplica
	
	;Imprime adios
	call Crlf
	mov edx,OFFSET adios
	CALL Writestring
	
	exit
main ENDP

multiplica PROC
		;Devuelve el valor de la mult
		
		;checamos cuantos recorremos
		mov eax,nVal		; number to display
		mov ecx,32		; number of bits in EAX
		mov esi,offset buffer

		L1:	  
			shl eax,1		; shift high bit into Carry flag
			mov BYTE PTR [esi],'0'		; choose char 0 as default digit
			jnc F2		; if no Carry, jump to L2
			mov BYTE PTR [esi],'1'		; else move char 1 to buffer
			F2:	  
				inc esi		; next buffer position
		loop L1		; shift another bit to left
		
		; en buffer ya tengo los 1's y 0'2
		MOV EBX,0
		MOV ESI, 0
		MOV EAX, 0
		MOV ECX,0
		
		inWhile:
		CMP EBX, 32 
		JGE outWHILE				
			MOV CL, buffer[esi]	
			CMP CL,'1'
			JNE noUno
				MOV EDX, ESI
				
				PUSH EAX
								
				MOV EAX,31
				SUB EAX,EDX
				MOV EDX, EAX
				
				POP EAX
				MOV unos[EAX], DL
				INC EAX
				MOV index, EAX
				
				INC numUnos
			noUno:
			INC ESI 
			INC EBX			
		JMP inWhile
		outWHILE:
				
		MOV EBX,0
		MOV ESI, 0
		MOV EAX, mVal
		MOV ECX,0
		
		inWhile2:
		CMP EBX, numUnos 
		JGE outWHILE2
			MOV CL,unos[ESI]
			
			Push EAX
			MOV EAX,0
			MOV AL, unos[ESI]
			MOV EDX, offset texto2
			CALL WriteString
			MOV EDX, offset texto2a
			CALL WriteString
			CALL WriteInt
			call Crlf
			POP EAX
			
			
			SHL EAX, CL
			MOV Recorridos[ESI*4],EAX 
						
			INC ESI 
			INC EBX		
			MOV EAX,mVal
		JMP inWhile2
		outWHILE2:

		MOV EBX,0
		MOV ESI, 0
		MOV EAX,0
		
		inWhile3:
		CMP EBX, numUnos 
		JGE outWHILE3			
			ADD EAX, Recorridos[ESI*4] 
			INC ESI 
			INC EBX			
		JMP inWhile3
		outWHILE3:
		
		MOV mult, EAX
		CALL WriteInt
	
	RET
multiplica ENDP

END main