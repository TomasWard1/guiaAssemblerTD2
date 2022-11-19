section .data
  arreglo:  dd 1, -2, 3, 0, -9, 2, 4, 2, 1, 9
  objetivo: dd 18
  msg1: db 'verdadero',10
  len1 equ $ - msg1
  msg2: db 'falso',10
  len2 equ $ - msg2
                               
global _start
section .text

  _start:                

    ; En la etiqueta arreglo se encuentran los numeros a sumar y comparar
    ; en Objetivo se encuentra el numero que deben sumar en el caso que exista.

    call sumarObjetivo

    ; Exit
    mov rax, 1     ; funcion 1 
    mov rbx, 0     ; codigo    
    int 0x80                   

sumarObjetivo:
    mov rcx, 0 ;indice1
    mov rdx, 1 ;indice2


ciclo:
    mov edi, [arreglo+rcx*4] ;pongo el primer numero del arreglo en edi
    
    cmp rcx,9 ;me fijo si ya estoy comparando el ultimo, en ese caso no hay combo
    jz noHayNada
    
    jmp ciclo2 ;voy al segundo ciclo para comparar este numero con los de su derecha
    
    noHayNada: 
    jmp imprFalse

ciclo2:
    push rdi

    add edi, [arreglo+rdx*4]
    cmp edi, [objetivo]
    jz imprTrue ;me fijo si encontre combo

    cmp rdx,9 ;me fijo si ya compare ese numero con el resto a su derecha
    jz repeatWithNext

    inc rdx
    pop rdi
    
    jmp ciclo2


repeatWithNext:   
    pop rdi
    inc rcx ;pongo el siguiente numero
    mov rdx, rcx 
    inc rdx ;pongo el indice2 en ese numero +1
    jmp ciclo

imprTrue:
    pop rdi
    mov rax,4
    mov rbx, 1
    mov rcx, msg1
    mov rdx, len1
    int 0x80
    ret

imprFalse:
    mov rax,4
    mov rbx, 1
    mov rcx, msg2
    mov rdx, len2
    int 0x80
    ret
