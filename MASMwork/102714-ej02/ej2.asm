TITLE Ejercicio 2             (ej2.asm)

; This program adds and subtracts 32-bit integers.


INCLUDE Irvine32.inc

.DATA

line1 BYTE  "Teclee el dato N: ",0 
line2 BYTE  "Resultado: ",0 
line3 BYTE  "Adios",0 
line4 BYTE  "Teclee la ",0
line6 BYTE  " tempreatura: ",0
line5 BYTE  "MAYOR: ",0
line7 BYTE  " y esta en la posicion",0
line8 BYTE  "Temperatura ",0
line9 BYTE  ": ",0
lista SDWORD  1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
res   DWORD 0
mayor SDWORD 0
menor SDWORD 0
cont  DWORD 0
cont2 DWORD ?
n     DWORD 0
temp  SDWORD ?



.CODE
main PROC
INI:	MOV   EDX, OFFSET line1
	CALL  WriteString
	CALL  ReadInt
	MOV   n,EAX
	JS INI
	JZ INI

	MOV   ECX,n
	MOV   ESI,OFFSET lista	
CICLO1:
		INC   cont
		MOV   EDX, OFFSET line4
		CALL  WriteString
		MOV   EAX, cont
		CALL  WriteInt
		MOV   EDX, OFFSET line6
		CALL  WriteString

		CALL  ReadInt
		MOV   temp,EAX
		
		MOV   [ESI],EAX
		ADD   ESI, TYPE lista

	Loop CICLO1

	MOV ECX,n
	
CICLO2:		
		MOV   EDX, OFFSET line8
		CALL  WriteString
		MOV   EAX, cont
		CALL  WriteInt
		DEC   cont
		MOV   EDX, OFFSET line9
		CALL  WriteString
		
		SUB   ESI, TYPE lista
		MOV   EAX,[ESI]
		
		CALL  WriteInt



		
		
		CALL  Crlf
	Loop CICLO2	

	
	MOV ESI, OFFSET lista;Direccion inicial de la memoria a vaciar. En este caso es la direccion de mi variable val1, no su valor por eso es el OFFSET
	MOV ECX, 20		;Cuantos registros voy a mostrar. En este caso tengo 4 (todas las variables)
	MOV EBX, 4	;Tamaño de cada registro. En este caso son DWORD entoces 4 (bytes)
	CALL DumpMem	




	EXIT
main ENDP
END main