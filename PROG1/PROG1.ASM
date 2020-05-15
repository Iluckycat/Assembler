.model small
.stack 100h
.486
.data
	a	db	5
	b	db	6
	c	db	7
	d	db	8
	e	db	9
.code
	mov	ax, @data
	mov	ds,ax
	mov 	al, d
	cbw 
	mov 	bx,ax
	mov 	al, e
	cbw
	add 	ax, bx
	mov 	bx, ax
	mov 	ax, 4
	mul	bx
	mov 	cx, ax

	mov 	al, b
	mul	al
	mul	ax
	mov 	bx, ax
	mov 	al, b
	mul 	al
	mul 	bx
	
	mov 	bx, ax
	mov 	al, a
	cbw	
	mul	bx
	mov 	bx, ax
	mov 	al, c
	cbw
	add 	ax, bx
	div 	cx
	mov	ax, 4c00h
	int 	21h
	end