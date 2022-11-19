section .data
  numero1: db 10
  numero2: dw 9
  numero3: dd 120

  msg1: db 'Son todos Positivos',10
  len1: equ $ - msg1
  msg2: db 'Son todos Negativos',10 
  len2: equ $ - msg2
  msg3: db 'Hay Positivos y Negativos',10
  len3: equ $ - msg3

                               
global _start
section .text

  _start:                

    ; En las etiquetas numero1, numero2 y numero3 se encuentran los tres numeros a comparar

    call tresNumeros

    ; Exit
    mov rax, 1     ; funcion 1 
    mov rbx, 0     ; codigo    
    int 0x80                   

tresNumeros:
push rax
push rbx
push rdx

mov al,[numero1]
mov bx,[numero2]
mov edx,[numero3]

mov rcx,0 ;contador de numeros positivos
  
  cmp al,0
  js esNegativo
  inc rcx

esNegativo: 
  cmp bx,0
  js esNegativo2
  inc rcx

esNegativo2:
  cmp edx,0
  js esNegativo3
  inc rcx
  
esNegativo3:
  cmp rcx,3

 pop rdx
 pop rbx
 pop rax

  je todosPositivos

  inc rcx
  inc rcx
  inc rcx
  cmp rcx,3

  jz todosNegativos
  jmp mixto




  todosNegativos:
   mov rax,4
  mov rbx,1
  mov rcx, msg2
  mov rdx, len2
  int 0x80
    ret


  todosPositivos:
   mov rax,4
  mov rbx,1
  mov rcx, msg1
  mov rdx, len1
  int 0x80
    ret

  mixto:
  mov rax,4
  mov rbx,1
  mov rcx, msg3
  mov rdx, len3
  int 0x80
    ret


