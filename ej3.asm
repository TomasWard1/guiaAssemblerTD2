section .data
  arreglo: dd 11,0,34,0,0,0,0,0,0,11
  msg1: db 'Positivo',10
  largo1 EQU $ - msg1   
  msg2: db 'Negativo',10
  largo2 EQU $ - msg2   
                               
global _start
section .text

  _start:                

    ; En la etiqueta arreglo se encuentran los 10 numeros a sumar.
    ; dejar el resultado en eax

    call sumarArreglo

    ; Exit
    mov rax, 1     ; funcion 1 
    mov rbx, 0     ; codigo    
    int 0x80                   

sumarArreglo:
  mov rcx,0 ;indice
  mov eax,0 ;inicializo el res en 0

  ciclo:
  add eax, [arreglo+rcx*4]
  inc rcx
  cmp rcx,10
  jnz ciclo

  cmp eax,0
  js imprNeg 

  imprPos:
  mov rax,4
  mov rbx,1
  mov rcx,msg1
  mov rdx,largo1
  int 0x80
  ret

   imprNeg:
  mov rax,4
  mov rbx,1
  mov rcx,msg2
  mov rdx,largo2 
  int 0x80
  ret
