TITLE Ejercicio 1            (ej1.asm)

; This program adds and subtracts 32-bit integers.


INCLUDE Irvine32.inc

.DATA

oneWord DWORD 12345678h

.CODE
main PROC


	MOV ESI, OFFSET oneWord ;Direccion inicial de la memoria a vaciar. En este caso es la direccion de mi variable val1, no su valor por eso es el OFFSET
	MOV ECX, 1		;Cuantos registros voy a mostrar. En este caso tengo 4 (todas las variables)
	MOV EBX, TYPE oneWord	;Tamaño de cada registro. En este caso son DWORD entoces 4 (bytes)
	CALL DumpMem

	MOV ESI, OFFSET oneWord ;Direccion inicial de la memoria a vaciar. En este caso es la direccion de mi variable val1, no su valor por eso es el OFFSET
	MOV ECX, 2		;Cuantos registros voy a mostrar. En este caso tengo 4 (todas las variables)
	MOV EBX, 2	;Tamaño de cada registro. En este caso son DWORD entoces 4 (bytes)
	CALL DumpMem

	MOV ESI, OFFSET oneWord ;Direccion inicial de la memoria a vaciar. En este caso es la direccion de mi variable val1, no su valor por eso es el OFFSET
	MOV ECX, 4		;Cuantos registros voy a mostrar. En este caso tengo 4 (todas las variables)
	MOV EBX, 1	;Tamaño de cada registro. En este caso son DWORD entoces 4 (bytes)
	CALL DumpMem
	EXIT
main ENDP
END main