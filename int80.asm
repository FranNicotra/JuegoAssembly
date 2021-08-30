;-----------------------------------------------------------------------
; INTERRUPCION QUE SIRVE PARA INFORMARME EL TIEMPO DEL SISTEMA
;-----------------------------------------------------------------------
.8086
.model tiny		; Definicion para generar un archivo .COM
.code
   org 100h		; Definicion para generar un archivo .COM
start:
   jmp main		; Comienza con un salto para dejar la parte residente primero

;------------------------------------------------------------------------
;- Part que queda residente en memoria y contine las ISR
;- de las interrupcion capturadas
;------------------------------------------------------------------------
Funcion PROC FAR
    sti   ; La funcion ISR que atendera la interrupcion capturada

    push cx

    mov ah, 2ch ;Tiempo del sistema
    int 21h     ;Ch = hora cl = minutos dh = segundos dl = 1/100 segundos 
    xor cx, cx

    pop cx


    iret
endp

; Datos usados dentro de la ISR ya que no hay DS dentro de una ISR
DespIntXX dw 0
SegIntXX  dw 0

FinResidente LABEL BYTE		; Marca el fin de la porción a dejar residente
;------------------------------------------------------------------------
; Datos a ser usados por el Instalador
;------------------------------------------------------------------------
Cartel    DB "Programa Instalado exitosamente!!!",0dh, 0ah, '$'

main:
; Se apunta todos los registros de segmentos al mismo lugar CS.
    mov ax,CS
    mov DS,ax
    mov ES,ax

InstalarInt:
    mov AX,3580h        ; Obtiene la ISR que esta instalada en la interrupcion
    int 21h    
    ;el 80 va a definir la posicion en donde se encuentra la
    ;interrepcion, de querer colocar nuevas interrupciones
    ;ademas de la 80 cambiar el numero 80 por otro
    ;ej:
    ;mov ax, 3581h <- solo cambie los ultimos 2 bytes
    ;int 21h


    mov DespIntXX,BX    
    mov SegIntXX,ES

    mov AX,2580h	; Coloca la nueva ISR en el vector de interrupciones
    ;aca lo mismo, si deseo crear otra interrupcion podes cambiar el numero de los
    ;dos ultimos bytes a una posicion disponible en el procesador
    mov DX,Offset Funcion    
    int 21h

MostrarCartel:
    mov dx, offset Cartel
    mov ah,9
    int 21h

DejarResidente:		
    Mov     AX,(15+offset FinResidente) 
    Shr     AX,1            
    Shr     AX,1        ;Se obtiene la cantidad de paragraphs
    Shr     AX,1
    Shr     AX,1	;ocupado por el codigo
    Mov     DX,AX           
    Mov     AX,3100h    ;y termina sin error 0, dejando el
    Int     21h         ;programa residente
end start