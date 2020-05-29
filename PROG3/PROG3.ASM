
;Сортировка столбцов матрицы по max в столбцах
	.model small
	.stack 100h
	.486
	.data
n	db 2
power	db 2


matrix	db 1,2
		db 3,4
matrix1	db 1,2
		db 3,4
matrix2	db 1,2
		db 3,4

curStrElem db 0
curColElem db 0
curPower db -1

i db 0
j db 0
k db 0

mat1 dw 0
mat2 dw 0

elemSum db 0

	.code
	mov ax, @data
	mov ds, ax
	mov es, ax;      для цепочечных команд

	cld

	lea ax, matrix1
	mov mat2, ax
	
	lea ax, matrix2
	mov mat1, ax
	
powerCyc:
		
	mov ax, mat1
	mov bx, mat2
	mov mat1, bx
	mov mat2, ax
	
	mov i, -1
	inc curPower
	xor ax, ax
	mov al, curPower
	cmp al, power
	je exit
	;Change matrixes
	strCyc:
		inc i
		xor ax, ax
		mov al, i
		cmp al, n		
		je powerCyc

		mov j, -1
		colCyc:
			inc j
			xor ax, ax
			mov al, j
			cmp al, n	;Column cycle
			je strCyc
				
			mov k, -1					
			mov elemSum, 0
			prodCyc:		
				inc k
				xor ax, ax
				mov al, k
				cmp al, n
				je insertElemToMatrix
								
				;call GetStrElem
				mov bx, 1
				xor ax, ax
				mov al, i
				imul bx, ax
				xor ax, ax
				mov al, n
				imul bx, ax
				add bl, k
				
				lea di, matrix
				add di, bx
				mov bx, ds:[di]
				
				mov curStrElem, bl
					
				;call GetColElem
						
				mov bx, 1
				xor ax, ax
				
				mov al, j
				imul bx, ax
				xor ax, ax
				mov al, n
				dec al
				imul bx, ax

				mov cx, 1
				xor ax, ax
				mov al , n
				imul cx, ax
				xor ax, ax
				mov al, k
				imul cx, ax
				
				add bx, cx
				
				mov di, mat1
				add di, bx
				mov bx, ds:[di]
				
				mov curColElem, bl
					
				xor ax, ax
				mov al , curStrElem
				imul bx, ax	
				add elemSum, bl
			jmp prodCyc
			
			insertElemToMatrix:
			mov di, mat2
			mov bx , 1
			xor ax, ax
			mov al, i
			imul bx, ax
			xor ax, ax
			mov al, n
			imul bx, ax
			
			add bl, j
			
			add di, bx
			xor ax, ax
			mov al, elemSum
			stosb
			jmp colCyc
		;//
	;//
;//	

exit:	mov ax,4c00h
int 21h
end
