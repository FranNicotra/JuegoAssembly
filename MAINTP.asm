.8086
.model small
.stack 100
.data

bienvenida db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"         PREGUNTA2 SPD      ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     Nueva partida (ENTER)  ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     Salir del juego (ESC)  ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

ingrese_nombre_1 db, 0dh, 0ah, "     Nombre para jugador 1 : ",24h

ingrese_nombre_2 db, 0dh, 0ah, "     Nombre para jugador 2 : ",24h


jugar_nuevamente db, 0dh, 0ah, 0dh, 0ah, "        JUGAR NUEVAMENTE (ENTER)", 0dh, 0ah, 0dh, 0ah,24h
salir db            "         SALIR DEL JUEGO (ESC)", 0dh, 0ah, 0dh, 0ah,, 0dh, 0ah, 24h

;finjugador1 db, 0dh, 0ah, "            FIN JUGADOR 1", 0dh, 0ah,24h

finalizado db, 0dh, 0ah, "            FIN DE LA PARTIDA", 0dh, 0ah
estadisticas db, 0dh, 0ah, "              Estadisticas", 0dh, 0ah,0dh, 0ah, 24h

cargando db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"         PREGUNTA2 SPD      ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     Nueva partida (ENTER)  ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     Salir del juego (ESC)  ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

est_jugador_1 db "Jugador 1 | "
nombre_1 db 100 dup (24h), 0dh, 0ah, 24h

salto db, 0dh,0ah,24h

est_jugador_2 db,0dh, 0ah,"Jugador 2 | "
nombre_2 db 100 dup (24h), 0dh, 0ah, 24h

cargandoest db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     PARTIDA FINALIZADA!    ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

cargandoest2 db, 0DH, 0AH, 0DH, 0AH, "        CARGANDO ESTADISTICAS...", 0DH, 0AH, 24H

cargando1 db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     CARGANDO JUGADOR 1     ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

cargando2 db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     CARGANDO JUGADOR 2     ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

ganador1 db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     GANADOR  JUGADOR 1     ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

ganador2 db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"     GANADOR  JUGADOR 2     ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

empate1 db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"            EMPATE          ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

jugador1 db,0dh, 0ah, "               Jugador  1", 0dh, 0ah, 24h
jugador2 db,0dh, 0ah, "               Jugador  2", 0dh, 0ah, 24h

cronometro1 db,0dh, 0ah, "    Tiempo: "
cronometro db "000        ", 24h

puntaje1 db "Puntaje: "
puntaje db "000", 0dh, 0ah, 24h

puntaje2 db "Puntaje: "
puntaje21 db "000", 0dh, 0ah, 24h

correcta db "RESPUESTA CORRECTA +10", 24h
incorrecta db "RESPUESTA INCORRECTA -10" , 24h

.code

extrn caja_lectura:proc
extrn limpia_pantalla:proc
extrn tiempo:proc
extrn regtoascii:proc
extrn preguntas:proc
extrn preguntas_2:proc
extrn suma_puntaje:proc
extrn resta_puntaje:proc
extrn sonido:proc
extrn imagen:proc
extrn asciitoreg:proc
extrn ganador:proc
extrn color:proc
extrn carga_barra:proc
extrn selecciona_preguntas:proc

main proc

  mov ax,@data
  mov ds,ax

    call imagen
    
    mov cx, 2453       ;SONIDO 
    mov bx, 30
    call sonido

inicio:
call limpia_pantalla ;FUNCION QUE ME CAMBIA AL MODO DE VIDEO ELEGIDO Y LIMPIA LA CONSOLA

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 4
    mov dl, 3
    int 10h

    mov ah, 9
    lea dx, bienvenida ;CARTEL DE BIENVENIDA
    int 21h
op:
    xor ax,ax       ;VERIFICO QUE OPCION ELIGIO EL JUGADOR DEL MENU
    mov ah, 01h     ;Entrada de teclado para verificar respuesta
    int 16h 
    jz op
    mov ah, 00h     ;Verifico  si se esta presionando la tecla
    int 16h

    cmp al, 0dh ;SI ES ENTER, ENTRA AL JUEGO
    je nombres
    cmp al, 1bh ;SI ES ESC, SALE DEL JUEGO
    je sale
    jmp op
sale:
    jmp salir_juego    

nombres:       
    ;SI ENTRO A NOMBRES, SIGNIFICIA QUE SE INICIO EL JUEGO  
    mov ah, 9                 ;INGRESO NOMBRE PARA EL JUGADOR 1
    lea dx, ingrese_nombre_1
    int 21h
    xor bx, bx
    lea bx, nombre_1
    call caja_lectura

    mov ah, 9                 ;INGRESO NOMBRE PARA EL JUGADOR 2
    lea dx, ingrese_nombre_2
    int 21h
    xor bx, bx
    lea bx, nombre_2
    call caja_lectura

    xor ax, ax
    xor dx, dx
    xor cx, cx

carga_jugador_1:
    call selecciona_preguntas ;CON ESTA FUNCION CARGO LAS 19 PREGUNTAS PARA CADA JUGADOR

    call limpia_pantalla

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 4
    mov dl, 3
    int 10h

    mov ah, 9
    lea dx, cargando1
    int 21h

    call carga_barra     ;BARRA PARA INDICIAR QUE EL JUEGO ESTA CARGANDO

empieza:                                ;EMPIEZA EL JUEGO
    xor bx, bx
    mov ch, 0

    lea bx, puntaje  ;MUEVO PUNTAJE A BX Y LLAMO A REG TO ASCII PARA VOLVER A PONER EL PUNTAJE EN 0
    call regtoascii  ;CUANDO SE INICIE UNA NUEVA PARTIDA

    xor cx, cx
    xor bx, bx

    mov ch, 0
    lea bx, puntaje21  ;REPITO EL PROCESO DE ARRIBA PARA EL PUNTAJE DEL JUGADOR 2
    call regtoascii

    xor ax, ax ;VACIO REGISTROS
    xor dx, dx
    xor cx, cx
    xor si, si

    mov ch, 41  ;CANTIDAD DE SEGUNDOS POR JUGADOR
    xor bx, bx

carga_pregunta: ;CARGO PRIMER PREGUNTA

actualiza_pantalla:

    int 80h ;INTERRUPCION QUE ME DEVUELVE EL TIEMPO DEL SISTEMA

    cmp al, dh  ;COMPARO PARA VER SI YA PASO 1 SEGUNDO
    je actualiza_pantalla ;ACTUALIZO HORA SI NO PASO 1 SEGUNDO

    dec ch      ;DECREMENTO CH (SEGUNDOS DEL CRONOMETRO)

    cmp ch, 0   ;CUANDO CH LLEGUE A 0 TERMINA
    je fin_jugador_mid1
    push cx     ;ME GUARDO EL VALOR DE LOS SEGUNDOS

    lea bx, cronometro  ;CONVIERTO EL TIEMPO DEL CRONOMETRO ACTUAL EN UN ASCII PARA DESPUES MOTRARLO EN PANTALLA
    call regtoascii

    call limpia_pantalla ;LIMPIO PANTALLA

    mov al, dh           ;MUEVO LOS SEGUNDOS ACTUALES A AL PARA DESPUES COMPARAR

    mov ah, 9            ;MUESTRO JUGADOR
    lea dx, jugador1
    int 21h

    mov ah, 9
    lea dx, cronometro1  ;MUESTRO TIEMPO
    int 21h

    mov ah, 9
    lea dx, puntaje1     ;MUESTRO PUNTAJE
    int 21h

    mov bx, 3 ;PONGO BX EN  UN VALOR DISTINTO A 1 Y 0
    
    call preguntas       ;LLAMO A LA FUNCION QUE ME VA A ELEGIR LA PREGUNTA Y VERIFICA SI ES CORRECTA O INCORRECTA

    cmp bx, 0            ;SI PREGUNTAS DEVUELVE UN 0 EN BX LA RESPUESTA ES INCORRECTA
    je es_incorrecta
    cmp bx, 1            ;SI PREGUNTAS DEVUELVE UN 1 EN BX LA RESPUESTA ES CORRECTA
    je es_correcta

    jmp act_pantalla     ;SI NO RESPONDIO, VUELVO A ACTUALIZAR PANTALLA

fin_jugador_mid1:
    jmp fin_jugador
es_incorrecta:           ;LA RESPUESTA ES INCORRECTA 
    xor bx, bx
    push si

    lea bx, puntaje      ;COMO ES INCORRECTA, MUEVO PUNTAJE A BX Y PARA CONVERTIRLO EN ASCII
    call resta_puntaje

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 23
    mov dl, 9
    int 10h

    mov bl, 0100b       ;COLOR VERDE
    lea si, incorrecta
    call color

    mov cx, 9121       ;SONIDO DE RESPUESTA INCORRECTA
    mov bx, 25
    call sonido
    pop si

    jmp nueva_pregunta

es_correcta:           ;LA RESPUESTA ES CORRECTA
    xor bx,bx
    push si

    lea bx, puntaje    ;COMO ES CORRECTA, MUEVO PUNTAJE A BX Y PARA CONVERTIRLO EN ASCII
    call suma_puntaje 

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 23
    mov dl, 9
    int 10h

    mov bl, 1010b       ;COLOR VERDE
    lea si, correcta
    call color

    pop si

    mov cx, 5920       ;SONIDO DE RESPUESTA CORRECTA
    mov bx, 25
    call sonido

nueva_pregunta:        ;PROXIMA PREGUNTA
    inc si
    pop cx

    jmp actualiza_pantalla
act_pantalla:
    pop cx               ;DEVUELVO EL VALOR DE LOS SEGUNDOS ACTUALES
  
    jmp actualiza_pantalla

fin_jugador:             ;FIN JUGADOR UNO


;-------------------------------------------------------------------------------------
;------------------------            JUGADOR 2           -----------------------------
;-------------------------------------------------------------------------------------
    xor ax, ax
    xor dx, dx
    xor cx, cx
    xor bx, bx
    xor si, si
carga_jugador_2:

    call limpia_pantalla

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 4
    mov dl, 3
    int 10h
    
    mov ah, 9
    lea dx, cargando2
    int 21h

    call carga_barra

empieza2:
    mov si, 0   ;EL REG SI ME VA A AUMENTAR CADA VEZ QUE CAMBIO DE PREGUNTA
    mov ch, 41  ;CANTIDAD DE SEGUNDOS POR JUGADOR

carga_pregunta2:
    
actualiza_pantalla2:
   int 80h ;INTERRUPCION QUE ME DEVUELVE EL TIEMPO DEL SISTEMA

    cmp al, dh  ;COMPARO PARA VER SI YA PASO 1 SEGUNDO
    je actualiza_pantalla2 ;ACTUALIZO HORA SI NO PASO 1 SEGUNDO

    dec ch      ;DECREMENTO CH (SEGUNDOS DEL CRONOMETRO)

    cmp ch, 0   ;CUANDO CH LLEGUE A 0 TERMINA
    je fin_jugador_mid
    push cx     ;ME GUARDO EL VALOR DE LOS SEGUNDOS

    lea bx, cronometro 
    call regtoascii

    call limpia_pantalla ;LIMPIO PANTALLA

    mov al, dh           ;MUEVO LOS SEGUNDOS ACTUALES A AL PARA DESPUES COMPARAR

    mov ah, 9
    lea dx, jugador2
    int 21h

    mov ah, 9
    lea dx, cronometro1  ;MUESTRO TIEMPO
    int 21h

    mov ah, 9
    lea dx, puntaje2     ;MUESTRO PUNTAJE
    int 21h

siguiente_preg2:
    mov bx, 3

    call preguntas_2       ;LLAMO A LA FUNCION QUE ME VA A ELEGIR LA PREGUNTA Y VERIFICA SI ES CORRECTA O INCORRECTA

    cmp bx, 0            ;SI PREGUNTAS DEVUELVE UN 0 EN BX LA RESPUESTA ES INCORRECTA
    je es_incorrecta2
    cmp bx, 1            ;SI PREGUNTAS DEVUELVE UN 1 EN BX LA RESPUESTA ES CORRECTA
    je es_correcta2
  
    jmp act_pantalla2    ;SI NO RESPONDIO, VUELVO A ACTUALIZAR PANTALLA
fin_jugador_mid:
    jmp fin_jugador2

es_incorrecta2: 
    xor bx, bx
    push si

    lea bx, puntaje21     ;COMO ES INCORRECTA, MUEVO PUNTAJE A BX Y PARA CONVERTIRLO EN ASCII
    call resta_puntaje

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 23
    mov dl, 9
    int 10h

    mov bl, 0100b       ;COLOR VERDE
    lea si, incorrecta
    call color

    mov cx, 9121       ;SONIDO DE RESPUESTA INCORRECTA
    mov bx, 25
    call sonido
    pop si

    jmp nueva_pregunta2

es_correcta2:
    xor bx,bx
    push si

    lea bx, puntaje21    ;COMO ES CORRECTA, MUEVO PUNTAJE A BX Y PARA CONVERTIRLO EN ASCII
    call suma_puntaje 

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 23
    mov dl, 9
    int 10h

    mov bl, 1010b       ;COLOR VERDE
    lea si, correcta
    call color

    pop si

    mov cx, 5920       ;SONIDO DE RESPUESTA CORRECTA
    mov bx, 25
    call sonido
nueva_pregunta2:
    inc si
    pop cx

    jmp actualiza_pantalla2
act_pantalla2:
    pop cx               ;DEVUELVO EL VALOR DE LOS SEGUNDOS ACTUALES
  
    jmp actualiza_pantalla2

;TERMINA Y MUESTRA LAS ESTADISTICAS
fin_jugador2:
    
    call limpia_pantalla ;LIMPIO PANTALLA

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 4
    mov dl, 3
    int 10h
    
    mov ah, 9
    lea dx, cargandoest
    int 21h

    mov ah, 9
    lea dx, cargandoest2
    int 21h

    call carga_barra

    call limpia_pantalla

    mov ah, 9
    lea dx, finalizado ;CARTEL ESTADISTICAS
    int 21h

    mov ah, 9
    lea dx, est_jugador_1     ;JUGADOR 1
    int 21h

    mov ah, 9
    lea dx, salto     ;SALTO
    int 21h

    mov ah, 9
    lea dx, puntaje1          ;MUESTRO PUNTAJE
    int 21h

    mov ah, 9
    lea dx, est_jugador_2     ;JUGADOR 2
    int 21h

    mov ah, 9
    lea dx, salto     ;SALTO
    int 21h

    mov ah, 9
    lea dx, puntaje2          ;MUESTRO PUNTAJE
    int 21h

    xor bx, bx
    lea bx, puntaje           ;CONVIERTOS PUNTAJES A REG
    call asciitoreg

    mov al, dl
    push ax

    xor bx, bx
    lea bx, puntaje21         ;CONVIERTOS PUNTAJES A REG
    call asciitoreg

    pop ax
    xor bx, bx
    call ganador

    cmp bx, 1                 ;ME FIJO QUIEN ES EL GANADOR
    je ganador_2
    cmp bx, 0
    je ganador_1
    cmp bx, 2
    je empate

ganador_2:                    ;CARTELES DE GANADOR
    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 12
    mov dl, 3
    int 10h

    mov ah, 9
    lea dx, ganador2
    int 21h 
    jmp termina_programa
ganador_1:

    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 12
    mov dl, 3
    int 10h

    mov ah, 9
    lea dx, ganador1
    int 21h
    jmp termina_programa
empate:
    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 12
    mov dl, 3
    int 10h

    mov ah, 9
    lea dx, empate1
    int 21h

termina_programa:
    mov ah, 9
    lea dx, jugar_nuevamente
    int 21h

    mov ah, 9
    lea dx, salir
    int 21h

tecla:
    xor ax,ax
    mov ah, 01h     ;Entrada de teclado para verificar respuesta
    int 16h 
    jz tecla
    mov ah, 00h     ;Verifico  si se esta presionando la tecla
    int 16h

    cmp al, 1Bh
    je salir_juego
    cmp al, 0dh
    je nueva_partida
    jmp tecla

nueva_partida:
    jmp carga_jugador_1

salir_juego:
   
mov ax, 4c00h
        int 21h
main endp
end main