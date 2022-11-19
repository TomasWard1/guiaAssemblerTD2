section .data
  arreglo: dw 2,1,3,4,5,6,7,8,9,10,11,12,13,14,15,16
                               
global _start
section .text

  _start:                

    ; En la etiqueta arreglo se encuentran los 16 numeros a comparar.
    ; dejar el resultado en eax

    call mayor

    ; Imprimo el valor en rax
    mov rdi, rax ; paso como parametro rax como rdi
    call printHex

    ; Exit
    mov rax, 1     ; funcion 1 
    mov rbx, 0     ; codigo    
    int 0x80

mayor:
 push rbx
 mov rbx,0 ;indice
 mov rax,0 ;limpio el registro
 mov ax, [arreglo+rbx*2] ;meto el primer numero

 ciclo:
 inc rbx
 cmp ax, [arreglo+rbx*2]
 jae noreemplazar
 mov ax,[arreglo+rbx*2]

 noreemplazar:
 cmp rbx, 15
 jnz ciclo 

 pop rbx
 ret

; ---------------------------------------------
; printHex toma como parametro un valor en rdi
; e imprime dicho valor en hexadecimal
; ---------------------------------------------

printHex:
  push rbx
  push r12
  push r13
  push r14
  push r15
  push rbp
  mov rcx, 15
  mov rbx, hexachars
  .ciclo:
    mov rax, rdi
    and rax, 0xF
    mov dl, [rbx+rax]
    mov [number+rcx], dl
    dec rcx
    shr rdi, 4
    cmp rcx, -1
    jnz .ciclo
  mov rax, 4      ; funcion 4
  mov rbx, 1      ; stdout
  mov rcx, number ; mensaje
  mov rdx, 17     ; longitud
  int 0x80
  pop rbp
  pop r15
  pop r14
  pop r13
  pop r12
  pop rbx
ret

section .rodata
  hexachars: db "0123456789ABCDEF"

section .data
  number:    db "0000000000000000",10



;¿Que modifcaciones debe realizarse sobre el ejercicio anterior para soportar numeros con signo
;de 16 bits?
; Deberiamos usar otros jumps, para los que tienen signos.
