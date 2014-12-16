TITLE Examen Final        (ExFinLEMG124847.asm)

INCLUDE Irvine32.inc

.data
dwList LABEL DWORD
realList REAL4 -14.0, 23.0, -61.0, 120.0
sign BYTE 1 dup(0),0
exponent BYTE 16 dup(0),0
fraction BYTE 46 dup(0),0
num DWORD ?

label1 Byte "Soy LEMG124847",0
label2 Byte "REAL",0
label3 Byte "SIGN: ",0
label4 Byte "EXPONENT: ",0
label5 Byte "FRACTION: ",0
label6 Byte "ADIOS ",0

.code
main PROC
	MOV EDX, OFFSET label1
	CALL WriteString
	CALL Crlf

	MOV ESI, 0
	MOV ECX, LengthOF realList ;Obitene longitud de la lista

callFunc:
	MOV EAX, 0
	MOV EAX, dwList[ESI*4] ;Mueve a EAX el valor de la lista
	CALL expandReal ;Ejecuta Proc expandReal
	INC ESI ;incrementa ESI
	LOOP callFunc ;Vuelve a llamar al loop

	CALL Crlf
	MOV EDX, OFFSET label6
	CALL WriteString ;ADIOS
	exit
main ENDP


expandReal PROC
; Procedimiento que recibe un DWORD en EAX y que imprime
; los componentes del número rael.	

	PUSHAD
	CALL Crlf

	; Imprimir Signo
	MOV ESI, OFFSET sign
	SHL EAX, 1
	MOV BYTE PTR [esi],'0'	
	JNC L1
		MOV BYTE PTR [esi],'1'
L1:
	MOV EDX, OFFSET label2
	CALL WriteString
	CALL Crlf

	MOV EDX, OFFSET label3
	CALL WriteString
	MOV EDX, OFFSET sign
	CALL WriteString
	CALL Crlf

	;Imprimir Exponente
	MOV ESI, OFFSET exponent
	MOV EBX, 9
L8:
	DEC EBX
	CMP EBX, 0
	JE L8B
	SHL EAX, 1
	MOV BYTE PTR [esi],'0'	
	JNC L8A
		MOV BYTE PTR [esi],'1'
L8A:
	INC ESI
	LOOP L8

L8B:
	MOV EDX, OFFSET label4
	CALL WriteString
	MOV EDX, OFFSET exponent
	CALL WriteString
	CALL Crlf

	;Imprimir fraction
	MOV ESI, OFFSET fraction
	MOV EBX, 24
L23:
	DEC EBX
	CMP EBX, 0
	JE FIN
	SHL EAX, 1
	MOV BYTE PTR [esi],'0'	
	JNC L23A
		MOV BYTE PTR [esi],'1'
L23A:
	INC ESI
	LOOP L23

FIN:
	MOV EDX, OFFSET label5
	CALL WriteString
	MOV EDX, OFFSET fraction
	CALL WriteString
	CALL Crlf
	
	POPAD
	
	RET
expandReal ENDP

END main