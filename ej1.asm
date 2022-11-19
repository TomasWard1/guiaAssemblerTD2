section .data                  
  msg: DB 'T',10,'o',10,'m',10,'a',10,'s',10     
  largo EQU $ - msg            
                               
global _start                
section .text

  _start:                

    call nombre

    mov rax, 1     ; funcion 1 
    mov rbx, 0     ; codigo    
    int 0x80                   

nombre:
  mov rax, 4
  mov rbx, 1
  mov rcx, msg
  mov rdx, largo
  int 0x80
ret


/*
Considerando la solucion de los ejercicios anteriores, ¿cuantas veces se llama al sistema para imprimir en pantalla en cada caso?
 En ambos casos se llama al sistema una vez para imprimir, y otra vez para hacer el exit.
 */
 
