TITLE Program Template          (RevStr.asm)

; This program reverses a string.
; Last update: 1/28/14

INCLUDE Irvine32.inc

.data
texto Byte "Escriba el valor de n: ",0
texto2 Byte "Dword ",0
texto2a Byte "o: ",0
texto3 Byte "Bits a desplazar: ",0
texto4 Byte "RESULTADOS: ",0
texto5 Byte "inicial: ",0
texto6 Byte "una vez deplazados: ",0
adios Byte "ADIOS",0
aux DWORD 1
nVal DWORD ?
nBits DWORD ?
arrLista DWORD 100 DUP(?)
i DWORD 0
j DWORD 0
aux2 DWORD ?
ciclo DWORD ?

.code
main PROC
	;Procedimiento Principal	
		
	CALL leeHex
	mov EDX, OFFSET texto4
    call WriteString
    call Crlf
	MOV EDX, OFFSET texto5 ;incial
	CALL WriteString 
	call Crlf
	
	mov ECX,nVal
	MOV EDI,nVal
	DEC EDI
	IMUL EDI,4
	MOV ciclo, EDI
	
	CALL DisplayArray
	CALL rotaHexadecimal
	MOV EDX, OFFSET texto6 ;deplazados
	CALL WriteString 
	call Crlf
	mov ECX,nVal
	CALL DisplayArray
	
	;Imprime adios
	call Crlf
	mov EDX,OFFSET adios
	CALL Writestring
	
	exit
main ENDP

leeHex PROC
		;Devuelve el valor de n, nbits y los hexadecimales en el arreglo

		MOV EDX, OFFSET texto 
		CALL WriteString 
		CALL ReadInt
		MOV nVal,EAX	
	
		MOV EBX,0
		MOV ESI, i
		inWhile:
		CMP EBX, nVal 
		JGE outWHILE				
			MOV EDX, OFFSET texto2 
			CALL WriteString 
			MOV EAX, aux
			CALL WriteInt
			MOV EDX, OFFSET texto2a 
			CALL WriteString 
			CALL ReadHex
			MOV arrLista[ESI*4], EAX			
			
			INC ESI ;indice para guardar en el arreglo
			INC aux ;indice de dato en el que va los hex
			INC EBX			
		JMP inWhile
	outWHILE:
	
		MOV EDX, OFFSET texto3
		CALL WriteString
		CALL ReadInt
		MOV nBits, EAX
		
	
	RET
leeHex ENDP

rotaHexadecimal PROC
	;Recibe el arreglo de hexadecimales
	;Devuelve el mismo arreglo pero con los exadecimales ya rotados
	mov esi,0
	MOV aux2, EDI
	ADD ESI,aux2
	MOV ECX, nBits
	shr arrLista[esi],CL 	; highest dword
	SUB ESI,aux2
	SUB EDI,4
	MOV aux2,EDI
	ADD ESI,aux2
	DEC nVal
	
	MOV EBX,0
	inWhile:
		CMP EBX, nVal 
		JGE outWHILE				
			rcr arrLista[esi],CL    		; middle dword, include Carry flag
			SUB ESI,aux2
			SUB EDI,4
			MOV aux2,EDI
			ADD ESI,aux2			
		
			INC EBX			
		JMP inWhile
	outWHILE:
	
	INC nVal
	call Crlf
	RET	
rotaHexadecimal ENDP

DisplayArray PROC
	pushad

	mov esi,ciclo
L1:
	  mov  eax,arrLista[esi]
	  call WriteBin	; display binary bits
      call Crlf
	  sub  esi,4
	Loop L1
	call Crlf

	popad
	ret
DisplayArray ENDP

END main