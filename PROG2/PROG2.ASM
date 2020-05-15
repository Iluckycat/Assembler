.model small
.stack 100h
.486
.data
	byte1	db	10101010b
	word1	dw	? 	
.code
	
	mov 	ax,@data
	mov 	ds,ax
	mov 	al,byte1	
	mov 	ah,00000000b
	mov 	bl,al

	rcr 	al,1
	rcl	ah,1

	rcr 	al,1
	rcl	ah,1

	rcr 	al,1
	rcl	ah,1

	rcr	al,1
	rcl	ah,1

	rcr	al,1
	rcl	ah,1

	rcr	al,1
	rcl	ah,1

	rcr	al,1
	rcl	ah,1

	rcr	al,1
	rcl	ah,1
	
	mov 	al,bl
	mov	word1,ax

	mov 	ax,4c00h
	int 	21h
	end