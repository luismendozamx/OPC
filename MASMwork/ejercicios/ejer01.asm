TITLE  ejer01.asm

Comment !
Description: Write instructions that use direct-offset
addressing to move the four values in Uarray to the
EAX, EBX, ECX, and EDX registers. When you follow this
with a CALL DumpRegs statement, the following register
values should display:
	EAX=00001000 EBX=00002000 ECX=00003000 EDX=00004000

Next, write instructions that use direct-offset addressing
to move the four values in Sarray to the EAX, EBX, ECX, and EDX
registers. When you follow this with a CALL DumpRegs statement,
the following register values should display:
	EAX=FFFFFFFF EBX=FFFFFFFE ECX=FFFFFFFD EDX=FFFFFFFC

Do it in an optimized way.
!

INCLUDE Irvine32.inc

.DATA
Uarray WORD 1000h,2000h,3000h,4000h
Sarray SWORD -1,-2,-3,-4

.CODE
main PROC
	; instructions for Uarray
	MOVZX EAX, Uarray
	MOVZX EBX, Uarray+2
	MOVZX ECX, Uarray+4
	MOVZX EDX, Uarray+6
	CALL	 DumpRegs

	; instructions for Sarray
	MOVSX EAX, Sarray
	MOVSX EBX, Sarray+2
	MOVSX ECX, Sarray+4
	MOVSX EDX, Sarray+6
	CALL	 DumpRegs

	EXIT
main ENDP

END main