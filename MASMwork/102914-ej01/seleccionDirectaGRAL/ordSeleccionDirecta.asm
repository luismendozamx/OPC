TITLE selDirecta.asm

INCLUDE Irvine32.inc

.DATA
array SDWORD 5,3,4,1,2
indexI SDWORD 0
indexJ SDWORD 1
n SDWORD 5
first SDWORD ?
temp SDWORD ?
menor SDWORD ?
aLength SDWORD ?
aLength2 SDWORD ?
pos SDWORD ?

.CODE

main PROC

MOV ESI,LENGTHOF array
MOV aLength,ESI
MOV aLength2,ESI
DEC aLength
;MOV EDI ;array.LENGTH
MOV EAX,indexI ;i es EAX
MOV ECX,indexJ ;j es ECX

inWhile:
	CMP EAX, aLength ;for(i=0; i<A.length-1;i++
	JGE outWHILE		
		MOV EBX, array[EAX*4] ;EBX = A[i]
		MOV menor,EBX
		MOV pos,EAX
		
		INC EAX
		MOV ECX,EAX
		DEC EAX
	
	inWhile2: ;for (j=i+1;j<A.length;j++
			CMP ECX,aLength2 ;j<A.length
			JGE outWhile2 
				MOV EDX, array[ECX*4] ;EDX = A[j]
				CMP EDX,menor
				JGE outIF
					MOV menor,EDX
					MOV pos,ECX
				outIF:
				INC ECX ;j++
				JMP inWhile2
			outWhile2:
				CMP pos, EAX ;if (pos!=i)
				JE outIF2 
					MOV temp,EBX ;tmp = A[i]
					MOV ESI,pos
					MOV EDI,array[ESI*4]
					MOV array[EAX*4],EDI ;A[i]=A[pos]
					MOV EDI,temp
					MOV array[ESI*4],EDI ;A[pos] = temp 
				outIF2:	
				INC EAX
				JMP inWhile
	outWHILE:
		MOV EBX,0
	
	whileIMP:
		CMP EBX,aLength2
		JGE adios
			MOV EAX,array[EBX*4]
			CALL writeInt
			INC EBX
			JMP whileIMP
	adios:
	   
			

	EXIT
main ENDP

END main