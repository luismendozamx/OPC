TITLE eje1            (eje1.asm)

INCLUDE Irvine32.inc

.DATA
    


 
.CODE
main PROC
	MOV EAX,0
	MOV ECX,5
L1:	ADD EAX,ECX
LOOP L1

	CALL DumpRegs
	EXIT

main ENDP
END main