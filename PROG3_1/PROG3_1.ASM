;Умножение матриц
.model small
.stack 100h
.486
.data
		A dw  3,1,4,2,7,1,9,5,4
		B dw  3,1,4,2,7,1,9,5,4
		R dw  0,0,0,0,0,0,0,0,0
		N dw  3
		
.code
    mov si,0        ;i=0
lp11:   mov cx,0        ;j=0
lp12:   mov ax,si       ;i
    mul n           ;i*q
    mov bx,ax       ;i*q
    add bx,cx       ;i*q+j
    shl bx,2        ;[i][j]
    fldz            ;0
    mov di,bx       ;сохранить индекс[i][j]
    fstp    R[bx]       ;R[i][j]=0
    mov bp,0        ;k=0
lp13:   mov ax,si       ;i
    mul n       ;i*n
    mov bx,ax       ;i*n
    add bx,bp       ;i*n+k
    shl bx,2        ;[i][k]
    fld A[bx]       ;A[i][k]
    mov ax,bp       ;k
    mul n           ;k*q
    mov bx,ax       ;k*q
    add bx,cx       ;k*q+j
    shl bx,2        ;[k][j]
    fmul    B[bx]       ;A[i][k]*B[k][j]
    fadd    R[di]       ;R[i][j]+A[i][k]*B[k][j]
    fstp    R[di]       ;R[i][j]=R[i][j]+A[i][k]*B[k][j]
    inc bp      ;k=k+1
    cmp bp,n        ;k<n
    jb  lp13        ;если меньше - продолжить
    inc cx      ;j=j+1
    cmp cx,n        ;j<q
    jb  lp12        ;если меньше - продолжить
    inc si      ;i=i+1
    cmp si,n        ;i<m
    jb  lp11        ;если меньше - продолжить
end