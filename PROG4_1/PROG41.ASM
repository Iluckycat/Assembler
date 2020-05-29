.model small
	.stack 100h
	.data
string	db 'xcdr a abdr    edr  zaq aqw  jgh t qwe',0
	.code
	mov ax,@data
	mov ds,ax
	mov es,ax
	cld
	lea si,string
	lea di,string
	xor bx,bx
	xor cx,cx
m1:	lodsb
	cmp al,0
	je m2
	cmp al,' '
	je m3
	push ax
	inc cx
	jmp m1
m2:	mov bx,1
m3:	jcxz m5
	cmp di,offset string
	je m4
	mov al,' '
	stosb
m4:	pop ax
	stosb
	loop m4
m5:	cmp bx,1
	jne m1
	mov al,0
	stosb	
	mov ax,4c00h
	int 21h
	end
