TITLE Displaying Binary Bits                (WriteBin.asm)

; Display a 32-bit integer in binary.
; Last Update: 22/07/14

INCLUDE Irvine32.inc

.data
binValue DWORD 12345678h		; sample binary value
buffer BYTE 40 dup(0),0
salto BYTE 'salto',0
cont WORD ?
.code
main PROC
	mov eax,binValue		; number to display
	mov ecx,39		; number of bits in EAX
	mov esi,offset buffer
	CALL convertirABinario
	mov edx,OFFSET buffer		; display the buffer
	call WriteString
	call Crlf
	exit
main ENDP

convertirABinario PROC
MOV EBX, 5
L1:
	  DEC EBX	
	  CMP EBX,0
	  JE espacio

	  shl eax,1		; shift high bit into Carry flag
	  mov BYTE PTR [esi],'0'		; choose char 0 as default digit
	  jnc F2		; if no Carry, jump to L2
	    mov BYTE PTR [esi],'1'		; else move char 1 to buffer
	  jmp F2  
	espacio:
		     mov BYTE PTR [esi],' '
		     mov EBX,5


	F2:	  inc esi		; next buffer position
	INC cont
	loop L1		; shift another bit to left
	RET
convertirABinario ENDP
END main