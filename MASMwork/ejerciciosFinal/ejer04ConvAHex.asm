TITLE Program Template          (RevStr.asm)

INCLUDE Irvine32.inc

.data
texto BYTE "Teclee el valor entero: ", 0
texto2 BYTE "El entero equivalente HEX es: ", 0
adios Byte "ADIOS",0
entero SDWORD ?	
divisor SDWORD 16
res SDWORD 32 dup(0)
cociente SDWORD ?
residuo SDWORD ?
impIn SDWORD ?
suma SDWORD ?
aux SDWORD ?

.code
main PROC
	;Procedimiento Principal	
		
	MOV EDX, OFFSET texto
	CALL WriteString ;teclee el valor de n
	CALL ReadInt
	CALL Crlf
	
	MOV entero ,EAX ;primer numero que mete el usuario
	
	CALL convierteAHex
	
	MOV impIn, EDI
	MOV EBX,0
	inWhile2:
		CMP EDI, EBX
		JL outWHILE2	
			MOV EAX, res[EDI*4]
			MOV aux, EDI
			IMUL EDI,4
			MOV EDX, EDI
			MOV CL,DL
			SHL EAX, CL
			ADD suma, EAX
			MOV EDI,aux
			DEC EDI	
		JMP inWhile2
		outWHILE2:
		
		MOV EDX, OFFSET texto2
		CALL WriteString
		MOV EAX, suma
		CAll WriteHex
	
	;Imprime adios
	call Crlf
	mov edx,OFFSET adios
	CALL Writestring
	
	exit
main ENDP

convierteAHex PROC
		;Devuelve el string en hexadecimales
		
		MOV EDX,0
		MOV EAX,entero ;aqui ya tengo el dividendo				
		MOV EDI,0
		
		inWhile:
		CMP EAX, 16
		JL outWHILE				
			IDIV divisor
			MOV cociente,EAX
			MOV residuo, EDX 
			MOV res[EDI*4],EDX
			INC EDI	
		JMP inWhile
		outWHILE:
		MOV res[EDI*4],EAX	
		
	RET
convierteAHex ENDP

END main