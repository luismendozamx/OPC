TITLE Multiple Doubleword Shift            (MultiShifta.asm)

; Demonstration of multi-doubleword shift, using
; SHR and RCR instructions.
; Last update:22/07/14

INCLUDE Irvine32.inc

.data
ArraySize = 3
array DWORD 12345678h, 9ABCDEF1h, 23456789h
before BYTE "Before",0 
after BYTE "After",0 

.code
main PROC
	call ClrScr
     mov edx, OFFSET before
     call WriteString
     call Crlf

	call DisplayArray		; display the array

; Shift the doublewords 1 bit to the right:
	mov esi,0
	shr array[esi+8],1     		; highest dword
     rcr array[esi+4],1     		; middle dword, include Carry flag
     rcr array[esi],1     		; low dword, include Carry flag
     call Crlf
	call DisplayArray		; display the array
	exit
main ENDP

;----------------------------------------------------
DisplayArray PROC
;----------------------------------------------------
	pushad

     mov edx, OFFSET after
     call WriteString
     call Crlf

	mov ecx,ArraySize
	mov esi,8
L1:
	  mov  eax,array[esi]
	  call WriteBin	; display binary bits
       call Crlf
	  sub  esi,4
	Loop L1
	call Crlf

	popad
	ret
DisplayArray ENDP

END main