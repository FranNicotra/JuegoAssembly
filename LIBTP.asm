.8086
.model small
.stack 100
.data

filename db 'test.bmp',0

filehandle dw ?

Header db 54 dup (0)

Palette db 256*4 dup (0)

ScrLine db 320 dup (0)

ErrorMsg db 'Error', 13, 10,'$'

Vector		db "QWERTYUIOPASDFGHJKLZXCVBNMabcdefghijkl", 0FFh

Preguntas1	db 19 dup(20h), 0Dh, 0Ah, 24h, 0FFh	; Vector con los nros de preguntas que le toco
											; ATENCION!Si "Vector" es de 10 elementos, Preguntas1 y 2
											; son "db" y la mitad de los elementos, 5
Preguntas2	db 19 dup(20h), 0Dh, 0Ah, 24h, 0FFh
Long 		db 26H		; cantidad total de preguntas - Debe ser siempre par
CantPregxP	db 00h		; cantidad de preguntas por participante
Var1		db 00h		; variable A para LOOP de preguntas por participante
Var2		db 00h		; variable J para LOOP de eliminación de la pregunta asignada al jugador
Aleatorio	db 00h		; Nro aleatorio fijo para ver que anda

barra_carga db,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h,0DCh,24h

pregcero db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"    CUAL ES EL ASCII PARA      ",0dbh,0dh,0ah           
	db,20h,20h,20h,0dbh,"      LA BAJADA DE LINEA       ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
         db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," A : 0ah                       ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," B : 0bh                       ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," C : 0ch                       ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," D : 0dh                       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

preguno  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"SISTEMA BINARIO UTILIZADO PARA ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"  HACER CALCULOS CON CIFRAS    ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     ENTERAS CON SIGNO         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Complemento A2            ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Complemento A1            ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Signo y magnitud          ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Exceso 2 a la menos 1     ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregdos  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"      LOS DISCOS RIGIDOS       ",0dbh,0dh,0ah           
	db,20h,20h,20h,0dbh,"   Y FLEXIBLES SON UNIDADES    ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"        DE MEMORIAS..          ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," A : De acceso aleatorio       ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," B : Secuencial                ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," C : Semi-aleatorias           ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtres  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,"   EN CUAL DE ESTAS MEMORIAS   ",0dbh,0dh,0ah           
	 db,20h,20h,20h,0dbh,"  SE COLOCA UN DIODO EN DONDE  ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,"   SE QUIEREN GUARDAR CEROS    ",0dbh,0dh,0ah
          db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
          db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	 db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
          db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," A : PROM                      ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," B : EPROM                     ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," C : EEPROM                    ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," D : ROM                       ",0dbh,0dh,0ah
          db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
          db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregcuatro  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"    PARA PASAR DE UNA SENIAL   ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"        CODIFICADA A UNA       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"  NO CODIFICADA SE UTILIZA UN  ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Decodificador             ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Codificador               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Conversor de codigo       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Ninguna es correcta       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregcinco  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	  db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,"    CUAL DE LAS SIGUIENTES     ",0dbh,0dh,0ah           
	  db,20h,20h,20h,0dbh,"  OPCIONES NO PERTENECE A LA   ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,"  ESTRUCTURA DEL COMPUTADOR    ",0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	  db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," A : Memoria principal         ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," B : Unidad Central de Proceso ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," C : Logica secuencial         ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," D : Unidad de Entrada/Salida  ",0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregseis  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,"   CUANTOS BYTES OCUPA UNA     ",0dbh,0dh,0ah           
	 db,20h,20h,20h,0dbh,"       INTRUCCION INTO         ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
          db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
          db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	 db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
          db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," A : 2                         ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," B : 1                         ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," C : 3                         ",0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	 db,20h,20h,20h,0dbh," D : 4                         ",0dbh,0dh,0ah
          db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
          db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregsiete  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      QUE TIPO DE MEMORIA      ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"  NECESITA UN PULSO DE ENERGIA ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"    PARA MANTENER SUS DATOS    ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : DRAM                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : SRAM                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : ROM                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : MRAM                      ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 
         
pregocho  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     COMO SE INDICA QUE EL     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"    PROCESADOR ENCONTRO LO     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      QUE BUSCABA EN CACHE     ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : MISS                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : HIT                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : FOUND                     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : FAULT                     ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 

pregnueve  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"       COMO SE HACE PARA       ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"      GUARDAR UN UNO EN UN     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   FLIP FLOP ASINCRONICAMENTE  ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : SET=0 CLR=0               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : D=1 Y PULSO DE CLK        ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : SET=0 CLR=1               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : SET=1 CLR=0               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 

pregdiez  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   QUE METODO NO CORRESPONDE   ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"      PARA SACAR UN BLOQUE     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"        DE MEMORIA CACHE       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : FIFO                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : LRU                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : MSB                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : RANDOM                    ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 

pregonce  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     QUE SUGNIFICA EL 'EX'     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"       DE  IF,ID,OF,EX         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Intruction Execution      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Extraction Execution      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Intruction Decode         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Extraction Fetch          ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregdoce  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     CUAL DE LOS SIGUIENTES    ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"      NO ES UN PROBLEMA DE     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"          LOS PIPELINE         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Control                   ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Estructuras               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Datos                     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Escritura                 ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtrece  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"    QUE SENIAL LE AVISA A LA   ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"  CPU QUE HAY UNA INTERRUPCION ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      QUE REQUIERE ATENCION    ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : INTA                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : INTR                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : INSTA                     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : INTO                      ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregcatorce  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"  A QUE SE TIENE QUE EXPONER   ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"    UNA MEMORIA EPROM PARA     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   BORRARLE LA INFORMACION     ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Luz Natural               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Luz ultravioleta          ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Luz Infrarroja            ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : A un cable a 220v         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregquince  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   QUE OBTENGO AL DIVIDIR UN   ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"  ADDRESS POR LA CANTIDAD DE   ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     PALABRAS DE UN BLOQUE     ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Numero de bloque          ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Offset                    ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Numero de renglon         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Etiqueta                  ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregdseis  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     CUANTOS BITS TIENE EL     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"  DIRECCIONAMIENTO ISOLATED    ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   PARA LA E/S EN EL 8086      ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : 20 bits                   ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : 16 bits                   ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : 8 bits                    ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : 64 bits                   ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregdsiete  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," CUAL DE LAS SIGUIENTES CARAC. ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh," DE LAS PSEUDO INTERRUPCIONES  ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"         ES CORRECTA           ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Son predicibles           ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Son instrucciones         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Siempre se pueden anidar  ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Todas son correctas       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 
         
pregdocho  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"          DE QUE TIPO          ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"      ES LA INTERRUPCION       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"             NMI               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : 0Ah                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : 03h                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : 02h                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : 00h                       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 

pregdnueve  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      QUE MODO DE OPERACION    ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"   NO REQUIERE PEDIR PRESTADO  ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"           LOS BUSES           ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : MODO EN BLOQUES           ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : MODO SIMPLE               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : MODO A DEMANDA            ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 

pregveinte  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   COMO SE OBTIENE EL MENOR    ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"           ERROR DE            ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"        REPRESENTACION         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Redondeando               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Truncando                 ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Redondeando y truncando   ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Truncando y redondeando   ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregvuno  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      DONDE DE ENCUENTA LA     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"        MEMORIA PRINCIPAL      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Fuera del cpu             ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : En la placa madre         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Dentro del cpu            ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : En el gabinete            ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregvdos  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"    CUANTO TIEMPO TARDA EN     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"     DEVOLVER UN DATO LAS      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"        MEMORIAS SRAM          ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : 100 ns mas                ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : 1 segundo                 ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : 10 ns                     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : 1 ns o menos              ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregvtres  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"      CUAL NO ESTA DENTRO      ",0dbh,0dh,0ah           
	db,20h,20h,20h,0dbh,"           DE LA UCP           ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," A : Cache 1                   ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," B : Cache 2                   ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," C : Registros                 ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," D : Memoria Principal         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregvcuatro   db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"       QUE PIN RECIBE UNA      ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"        SOLICITUD DE DMA       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      PARA PEDIR LOS BUSES     ",0dbh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
              db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : HRQ                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : HOLD                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : DREQ                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Todas son correctas       ",0dbh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
              db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregvcinco db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,"   INDICAR SI SE PUEDE HACER   ",0dbh,0dh,0ah           
	  db,20h,20h,20h,0dbh,"    LA SIGUIENTE OPERACION:    ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,"           MOV BX,SI           ",0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	  db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," A : Verdadero                 ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," B : Falso                     ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," C : -                         ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," D : -                         ",0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregvseis  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	  db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,"       CUANTOS BITS USA        ",0dbh,0dh,0ah           
	  db,20h,20h,20h,0dbh,"       EL FORMATO SIMPLE       ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,"        DE LA IEEE 754         ",0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	  db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," A : 16 bits                   ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," B : 64 bits                   ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," C : 32 bits                   ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh," D : 128 bits                  ",0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregvsiete  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,"     QUE FUNCION TIENE EL      ",0dbh,0dh,0ah           
	   db,20h,20h,20h,0dbh,"       PUERTO DE CONTROL       ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,"          DE UNA E/S           ",0dbh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
            db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	   db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," A : Lectura y escritura       ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," B : Solo escritura            ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," C : Solo lectura              ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," D : Ninguna                   ",0dbh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
            db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 
         
pregvocho  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	  db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	  db,20h,20h,20h,0dbh,"     CUANTOS VECTORES TIENE    ",0dbh,0dh,0ah           
	  db,20h,20h,20h,0dbh,"        EL IVT DEL 8086        ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : 256                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : 128                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : 64                        ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : 32                        ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 

pregvnueve  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,"   INDICAR SI SE PUEDE HACER   ",0dbh,0dh,0ah           
	   db,20h,20h,20h,0dbh,"    LA SIGUIENTE OPERACION:    ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,"           MOV AL,DL           ",0dbh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
            db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	   db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," A : Verdadero                 ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," B : Falso                     ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," C : -                         ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," D : -                         ",0dbh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
            db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h 

pregtreita  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,"   QUE INSTRUCCION SE PONE AL  ",0dbh,0dh,0ah           
	   db,20h,20h,20h,0dbh," PRINCIPIO DE UNA INTERRUPCION ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," PARA PERMITIR EL ANIDAMIENTO  ",0dbh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
            db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	   db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
            db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," A : IVT                       ",0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	   db,20h,20h,20h,0dbh," B : SIT                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : STE                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : STI                       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtuno  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"    CON PRIORIDAD FIJA CUAL    ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"      DE LOS CANALES TIENE     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"        MENOR PRIORIDAD        ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : 0                         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : 1                         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : 2                         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : 3                         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtdos  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      COMO SE IMPIDE LA        ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"      MONOPOLIZACION DE        ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"      LOS DISPOSITIVOS         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Prioridad fija            ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Prioridad aleatoria       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Prioridad rotativa        ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Ninguno                   ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregttres  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     CON QUE INTRUCCION SE     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"   FINALIZA UNA INTERRUPCION   ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : IRET                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : RET                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : RETURN                    ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : IR                        ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtcuatro  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   CUANDO PASO PARAMETROS      ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"  POR STACK TENGO QUE MOVER    ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"         EL SP AL BP           ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Verdadero                 ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Falso                     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : -                         ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : -                         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtcinco  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"   QUE HACE LA INSTRUCCION     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"            PUSH F             ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : Guarda los flags al stack ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : Guarda el CS al stack     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : Guarda el IP al stack     ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Ninguna es correcta       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtseis  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     CON QUE INSTRUCCION       ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"  PUEDO RESTAR DOS REGISTROS   ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : ADD                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : MUL                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : SUB                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : DIV                       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtsiete  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
		 db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     CUAL DE LOS SIGUIENTES    ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"      SALTOS ES CON SIGNO      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : JG                        ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : JA                        ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : JBE                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : JNB                       ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtocho     db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     POR CUAL PIN LE MANDA     ",0dbh,0dh,0ah           
	     db,20h,20h,20h,0dbh,"   UNA SENIAL LA DMA A LA CPU  ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,"     PARA PEDIRLE LOS BUSES    ",0dbh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
              db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	     db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," A : HRQ                       ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," B : HOLD                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," C : DREQ                      ",0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	     db,20h,20h,20h,0dbh," D : Todas son correctas       ",0dbh,0dh,0ah
              db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
              db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

pregtnueve db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"    CUANTOS BYTES OCUPA UNA    ",0dbh,0dh,0ah           
	db,20h,20h,20h,0dbh,"        INSTRUCCION INTO       ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah
	db,20h,20h,20h,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," A : 1                         ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," B : 2                         ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," C : 3                         ",0dbh,0dh,0ah
	db,20h,20h,20h,0dbh,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0C4H,0dbh,0dh,0ah
	db,20h,20h,20h,0dbh," D : 4                         ",0dbh,0dh,0ah
         db,20h,20h,20h,0dbh,"                               ",0dbh,0dh,0ah
         db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h

nohaymas  db,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0DCh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"   PREGUNTAS FINALIZADAS    ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0dbh,"                            ",20h,20h,0dbh,0dh,0ah
           db,20h,20h,20h,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0DFh,0dh,0ah,24h
.code

public caja_lectura
public limpia_pantalla
public tiempo
public regtoascii
public preguntas
public preguntas_2
public suma_puntaje
public resta_puntaje
public sonido
public imagen
public asciitoreg
public ganador
public color
public carga_barra
public selecciona_preguntas

main proc

  mov ax,@data
  mov ds,ax
main endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA GUARDAR EN UNA VARIABLE, QUE EN ESTE CASO VA A SER CARGADA
;DESDE EL MAIN MOVIENDO EL OFFSET AL REG BX, UN TEXTO DE HASTA 255 CARACTERES
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

caja_lectura proc
    push ax
    push bx
    push si

    mov si, 0
carga:
    mov ah, 1
    int 21h
    cmp al, 0dh
    je afuera
    mov [bx][si], al
    inc si
    jmp carga

afuera:

    pop si
    pop bx
    pop ax


ret
caja_lectura endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA LIMPIAR LA PANTALLA Y CONFIGURARME EL MODO DE VIDEO QUE VOY
;A USAR
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

limpia_pantalla proc

    mov ah, 00h ;configuracion de modo de video
    mov al, 0dh ;elijo modo de video
    int 10h

    mov ah, 0bh ;configuracion 
    mov bh, 00h ;color de fondo
    mov bl, 00h ;elijo el color
    int 10h

ret
limpia_pantalla endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA INFORMARME EL TIEMPO DEL SISTEMA
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

tiempo proc

ret
tiempo endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA CONVERTIR UN ASCII A REGISTRO
;DEBEMOS PASARLE DESDE EL MAIN EL OFFSET DE LA VARIABLE AL REGISTRO BX
;EL REGISTRO CONVERTIDO ME VA A QUEDAR EN DL
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

asciitoreg proc

	xor dx, dx
	
	;CONSIGO CENTENA
	mov al, [bx][0] ;GUARDO EL DIGITO ASCII MAS SIGNIFICATIVO EN AL
	sub al, 30h    ;CONVIERTO ESE DATO A NRO
	mov cl, 100    ;GUARDO EN CL LA CANTIDAD PARA MULTIPLICAR
	mul cl         ;MULTIPLICO
	add dl, al     ;GUARDO EL RESULTADO

	;CONSIGO DECENA
	mov al, [bx][1]
	sub al, 30h
	mov cl, 10
	mul cl
	add dl, al 

	;CONSIGO UNIDAD
	mov al, [bx][2]
	sub al, 30h
	add dl, al 

ret
asciitoreg endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA CONVERTIR UN REGISTRO A ASCII USANDO EL REG CH
;EN EL MAIN ELEGIMOS EN QUE VARIBALE CARGAR ESTE NUMERO A CONVERTIR Y MOVEMOS SU 
;OFFSET A BX PARA QUE PUEDA SER GUARDADO
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

regtoascii proc

	push bp
	mov bp, sp

	xor ax, ax

	mov al, ch ;CARGO EN EL REGISTRO ACUMULADOR (AX) EL VALOR QUE QUIERO CONVERTIR
	mov cl, 100
	div cl ; AHORA QUE DIVIDÍ EN AH TENGO EL RESTO Y EN AL EL RESULTADO
	add al, 30h ; SUMO 30 h para convertir el nro en caracter ascii

	mov [bx][0], al; guardo el caracter en la posición mas significativa de la variable nro
	;GENERO CENTENA
	mov al, ah ; GUARDO EL NUEVO VALOR A DIVIDIR EN AL
	xor ah, ah ; LIMPIO AH (para que no me haga lio con la división)
	mov cl, 10 ; guardo el valor por el que voy a dividir en cl
	div cl     ; VUELVO A DIVIDIR
	add al, 30h
	mov [bx][1], al
	;GENERO DECENA 
	add ah, 30h
	mov [bx][2],ah	
	;GENERO UNIDAD
    pop bp
ret
regtoascii endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA SELECCIONAR QUE PREGUNTA ES LA QUE VOY A MOSTRAR EN PANTALLA
;MEDIANTE EL NUMERO RANDOM QUE SE VA A ENCONTRAR EN BX VOY A SELECCIONAR LA
;PREGUNTA A MOSTRAR
;DEPENDE LO QUE HAY EN BX VA A HACER EL SALTO A LA ETIQUETA CORRESPONDIENTE
;EN CADA ETIQUETA A LA PEGUNTA TENDREMOS QUE PASARLE POR EL REG DI EL OFFSET DE 
;LA VARIABLE DE LA PREGUNTA
;Y MEDIANTE EL REG CL LE TENDREMOS QUE PASAR CUAL ES LA OPCION CORRECTA
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

preguntas proc
   
    push ax
    push cx
    push dx

cargo_pregunta:
preg_0a5:
    cmp Preguntas1[si], 'A'   
    je preg_0   
    cmp Preguntas1[si], 'B'   
    je preg_1   
    cmp Preguntas1[si], 'C'
    je preg_2
    cmp Preguntas1[si], 'D'
    je preg_3
    cmp Preguntas1[si], 'E'
    je preg_4
    cmp Preguntas1[si], 'F'
    je preg_5
    jmp preg6a16
preg_0:
   	lea di, pregcero
   	mov cl, 'd'
    call pregunta_actual
    jmp sigo       
preg_1:
   	lea di, preguno
   	mov cl, 'a'
    call pregunta_actual
    jmp sigo       
preg_2:
	lea di, pregdos
	mov cl, 'c'
    call pregunta_actual
    jmp sigo
preg_3:
	lea di, pregtres
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_4:
	lea di, pregcuatro
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_5:
	lea di, pregcinco
	mov cl, 'c'
    call pregunta_actual
    jmp sigo

preg6a16:
    cmp Preguntas1[si], 'G'
    je preg_6
    cmp Preguntas1[si], 'H'
    je preg_7
    cmp Preguntas1[si], 'I'
    je preg_8
    cmp Preguntas1[si], 'J'
    je preg_9
    cmp Preguntas1[si], 'K'
    je preg_10
    cmp Preguntas1[si], 'L'
    je preg_11
    cmp Preguntas1[si], 'M'
    je preg_12
    cmp Preguntas1[si], 'N'
    je preg_13
    cmp Preguntas1[si], 'O'
    je preg_14
    cmp Preguntas1[si], 'P'
    je preg_15
    cmp Preguntas1[si], 'Q'
    je preg_16
    jmp preg17a27
preg_6:
	lea di, pregseis
	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_7:
	lea di, pregsiete
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_8:
	lea di, pregocho
	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_9:
	lea di, pregnueve
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_10:
	lea di, pregdiez
	mov cl, 'c'
    call pregunta_actual
    jmp sigo
preg_11:
	lea di, pregonce
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_12:
	lea di, pregdoce
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_13:
	lea di, pregtrece
	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_14:
	lea di, pregcatorce
	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_15:
	lea di, pregquince
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_16:
	lea di, pregdseis
	mov cl, 'b'
    call pregunta_actual
    jmp sigo

preg17a27:
    cmp Preguntas1[si], 'R'
    je preg_17
    cmp Preguntas1[si], 'S'
    je preg_18
    cmp Preguntas1[si], 'T'
    je preg_19
    cmp Preguntas1[si], 'U'
    je preg_20
    cmp Preguntas1[si], 'V'
    je preg_21
    cmp Preguntas1[si], 'W'
    je preg_22
    cmp Preguntas1[si], 'X'
    je preg_23
    cmp Preguntas1[si], 'Y'
    je preg_24
    cmp Preguntas1[si], 'Z'
    je preg_25
    cmp Preguntas1[si], 'a'
    je preg_26
    cmp Preguntas1[si], 'b'
    je preg_27
    jmp preg28a39

preg_17:
	lea di, pregdsiete
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_18:
	lea di, pregdocho
	mov cl, 'c'
    call pregunta_actual
    jmp sigo
preg_19:
  	lea di, pregdnueve
  	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_20:
	lea di, pregveinte
	mov cl, 'c'
    call pregunta_actual
    jmp sigo
preg_21:
	lea di, pregvuno
	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_22:
	lea di, pregvdos
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_23:
	lea di, pregvtres
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_24:
	lea di, pregvcuatro
	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_25:
	lea di, pregvcinco
	mov cl, 'b'
    call pregunta_actual
    jmp sigo
preg_26:
	lea di, pregvseis
	mov cl, 'c'
    call pregunta_actual
    jmp sigo
preg_27:
	lea di, pregvsiete
	mov cl, 'b'
    call pregunta_actual
    jmp sigo

preg28a39:
    cmp Preguntas1[si], 'c'
    je preg_28
    cmp Preguntas1[si], 'd'
    je preg_29
    cmp Preguntas1[si], 'e'
    je preg_30
    cmp Preguntas1[si], 'f'
    je preg_31
    cmp Preguntas1[si], 'g'
    je preg_32
    cmp Preguntas1[si], 'h'
    je preg_33
    cmp Preguntas1[si], 'i'
    je preg_34
    cmp Preguntas1[si], 'j'
    je preg_35
    cmp Preguntas1[si], 'k'
    je preg_36
    cmp Preguntas1[si], 'l'
    je preg_37
    jmp nomas

preg_28:
	lea di, pregvocho
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_29:
	lea di, pregvnueve
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_30:
	lea di, pregtreita
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_31:
	lea di, pregtuno
	mov cl, 'd'
    call pregunta_actual
    jmp sigo
preg_32:
	lea di, pregtdos
	mov cl, 'c'
    call pregunta_actual
    jmp sigo
preg_33:
	lea di, pregttres
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_34:
	lea di, pregtcuatro
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_35:
	lea di, pregtcinco
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_36:
	lea di, pregtseis
	mov cl, 'c'
    call pregunta_actual
    jmp sigo
preg_37:
	lea di, pregtsiete
	mov cl, 'a'
    call pregunta_actual
    jmp sigo

nomas:
    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 4
    mov dl, 3
    int 10h

    mov ah, 9
    lea dx, nohaymas
    int 21h
;Si salto a cambio significa que sigue contando el cronometro hasta encontrar un AL que verifique la comparacion
sigo: 

    pop dx
    pop cx
    pop ax
    
ret
preguntas endp

preguntas_2 proc
   
    push ax
    push cx
    push dx

cargo_pregunta_2:
preg_0a5_2:
    cmp Preguntas2[si], 'A'   
    je preg_0_2   
    cmp Preguntas2[si], 'B'   
    je preg_1_2   
    cmp Preguntas2[si], 'C'
    je preg_2_2
    cmp Preguntas2[si], 'D'
    je preg_3_2
    cmp Preguntas2[si], 'E'
    je preg_4_2
    cmp Preguntas2[si], 'F'
    je preg_5_2
    jmp preg6a16_2
preg_0_2:
   	lea di, pregcero
   	mov cl, 'd'
    call pregunta_actual
    jmp sigo2       
preg_1_2:
   	lea di, preguno
   	mov cl, 'a'
    call pregunta_actual
    jmp sigo2       
preg_2_2:
	lea di, pregdos
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2
preg_3_2:
	lea di, pregtres
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_4_2:
	lea di, pregcuatro
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_5_2:
	lea di, pregcinco
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2

preg6a16_2:
    cmp Preguntas2[si], 'G'
    je preg_6_2
    cmp Preguntas2[si], 'H'
    je preg_7_2
    cmp Preguntas2[si], 'I'
    je preg_8_2
    cmp Preguntas2[si], 'J'
    je preg_9_2
    cmp Preguntas2[si], 'K'
    je preg_10_2
    cmp Preguntas2[si], 'L'
    je preg_11_2
    cmp Preguntas2[si], 'M'
    je preg_12_2
    cmp Preguntas2[si], 'N'
    je preg_13_2
    cmp Preguntas2[si], 'O'
    je preg_14_2
    cmp Preguntas2[si], 'P'
    je preg_15_2
    cmp Preguntas2[si], 'Q'
    je preg_16_2
    jmp preg17a27_2
preg_6_2:
	lea di, pregseis
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_7_2:
	lea di, pregsiete
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_8_2:
	lea di, pregocho
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_9_2:
	lea di, pregnueve
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_10_2:
	lea di, pregdiez
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2
preg_11_2:
	lea di, pregonce
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_12_2:
	lea di, pregdoce
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_13_2:
	lea di, pregtrece
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_14_2:
	lea di, pregcatorce
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_15_2:
	lea di, pregquince
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_16_2:
	lea di, pregdseis
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2

preg17a27_2:
    cmp Preguntas2[si], 'R'
    je preg_17_2
    cmp Preguntas2[si], 'S'
    je preg_18_2
    cmp Preguntas2[si], 'T'
    je preg_19_2
    cmp Preguntas2[si], 'U'
    je preg_20_2
    cmp Preguntas2[si], 'V'
    je preg_21_2
    cmp Preguntas2[si], 'W'
    je preg_22_2
    cmp Preguntas2[si], 'X'
    je preg_23_2
    cmp Preguntas2[si], 'Y'
    je preg_24_2
    cmp Preguntas2[si], 'Z'
    je preg_25_2
    cmp Preguntas2[si], 'a'
    je preg_26_2
    cmp Preguntas2[si], 'b'
    je preg_27_2
    jmp preg28a39_2

preg_17_2:
	lea di, pregdsiete
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_18_2:
	lea di, pregdocho
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2
preg_19_2:
  	lea di, pregdnueve
  	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_20_2:
	lea di, pregveinte
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2
preg_21_2:
	lea di, pregvuno
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_22_2:
	lea di, pregvdos
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_23_2:
	lea di, pregvtres
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_24_2:
	lea di, pregvcuatro
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_25_2:
	lea di, pregvcinco
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2
preg_26_2:
	lea di, pregvseis
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2
preg_27_2:
	lea di, pregvsiete
	mov cl, 'b'
    call pregunta_actual
    jmp sigo2

preg28a39_2:
   cmp Preguntas2[si], 'c'
    je preg_28_2
    cmp Preguntas2[si], 'd'
    je preg_29_2
    cmp Preguntas2[si], 'e'
    je preg_30_2
    cmp Preguntas2[si], 'f'
    je preg_31_2
    cmp Preguntas2[si], 'g'
    je preg_32_2
    cmp Preguntas2[si], 'h'
    je preg_33_2
    cmp Preguntas2[si], 'i'
    je preg_34_2
    cmp Preguntas2[si], 'j'
    je preg_35_2
    cmp Preguntas2[si], 'k'
    je preg_36_2
    cmp Preguntas2[si], 'l'
    je preg_37_2
    jmp nomas

preg_28_2:
	lea di, pregvocho
	mov cl, 'a'
    call pregunta_actual
    jmp sigo
preg_29_2:
	lea di, pregvnueve
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_30_2:
	lea di, pregtreita
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_31_2:
	lea di, pregtuno
	mov cl, 'd'
    call pregunta_actual
    jmp sigo2
preg_32_2:
	lea di, pregtdos
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2
preg_33_2:
	lea di, pregttres
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_34_2:
	lea di, pregtcuatro
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_35_2:
	lea di, pregtcinco
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2
preg_36_2:
	lea di, pregtseis
	mov cl, 'c'
    call pregunta_actual
    jmp sigo2
preg_37_2:
	lea di, pregtsiete
	mov cl, 'a'
    call pregunta_actual
    jmp sigo2

nomas2:
    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 4
    mov dl, 3
    int 10h

    mov ah, 9
    lea dx, nohaymas
    int 21h
;Si salto a cambio significa que sigue contando el cronometro hasta encontrar un AL que verifique la comparacion
sigo2: 

    pop dx
    pop cx
    pop ax
    
ret
preguntas_2 endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA MOSTRAR EN PANTALLA LA PREGUNTA SELECCIONADA EN LA FUNCION DE PREGUNTAS,
;CADA PREGUNTA INGRESA MEDIANTE EL REG DI.
;EN EL VALOR DL VAMOS A TENER LA OPCION CORRECTA DE LA PREGUNTA QUE INGRESO A LA FUNCION
;Y CON ESE VALOR LA FUNCION VA A SABER SI LA RESPUESTA ES CORRECTA O INCORRECTA.
;DEPENDIENDO EL RESULTADO, DEVUELVE UN VALOR EN BX AL MAIN QUE LO VA A USAR PARA RECONOCER
;EL RESULTADO Y PODER MOSTRAR EN PANTALLA LOS CARTELES CORRESPONDIENTES Y SABER SI
;SUMAR O RESTAR PUNTAJE
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

pregunta_actual proc
    mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
    mov bh, 0
    mov dh, 5
    mov dl, 3
    int 10h
    xor ax, ax

    mov ah, 9        ;Muestro pregunta
    lea dx, [di]
    int 21h

    xor ax,ax       
    mov ah, 01h     ;Entrada de teclado para verificar respuesta
    int 16h 
    jz sigo1        
    mov ah, 00h     ;Verifico  si se esta presionando la tecla
    int 16h 
    cmp al, cl     ;Comparo letra presionada con la opcion correcta // en ch esta la cpcion correcta
    jg incorrecta1 ;Cambio la pregunta
    cmp al, cl    ;Comparo letra presionada con la opcion correcta
    jl incorrecta1 ;Cambio la pregunta
    cmp al, cl    ;Si es correcta la opcion elegida
    je correcta1 ;Salto a cambiar la pregunta
    jmp sigo1

correcta1: ;Cambia la pregunta
    xor bx, bx
    mov bx, 1 				;BX EN 1 INDICANDO QUE LA OPCION FUE LA CORRECTA

    jmp sigo1
incorrecta1:
    xor bx, bx

    mov bx, 0               ;BX EN 0 INDICANDO QUE LA OPCION FUE INCORRECTA

;Si salto a cambio significa que sigue contando el cronometro hasta encontrar un AL que verifique la comparacion
sigo1: 

ret
pregunta_actual endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA SUMAR EL PUNTAJE SI LA PREGUNTA ES INCORRECTA, INGRESA EL 
;PUNTAJE ACTUAL MEDIANTE BX DESDE EL MAIN, SE CONVIERTE A REGISTRO Y SE LE SUMA EL VALOR
;ELEGIDO, A LO ULTIMO LO VUELVO A CONVERTIR EN ASCII PARA VOLVER A MOSTRARLO EN PANTALLA
;MEDIANTE UN REGTOASCII
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------


suma_puntaje proc
    
    push ax
    push cx
    push dx

    xor dx, dx       ;Limpio registros
    xor cx, cx
    xor ax, ax
    ;CONSIGO CENTENA
    mov al, [bx][0] ;MUEVO A AL EL OFFSET DE BX EN 0 
    sub al, 30h     ;CONVIERTO ESE DATO A NRO
    mov cl, 100     ;GUARDO EN CL LA CANTIDAD PARA MULTIPLICAR
    mul cl          ;MULTIPLICO
    add dl, al      ;GUARDO EL RESULTADO

    ;CONSIGO DECENA
    mov al, [bx][1]
    sub al, 30h
    mov cl, 10
    mul cl
    add dl, al 

    ;CONSIGO UNIDAD
    mov al, [bx][2]
    sub al, 30h
    add dl, al 

;SUMA DE PUNTAJE
    xor ax, ax  ;Limpio ax
    mov al, 10  ;Muevo el numero del puntaje a AL
    add dl, al  ;Sumo

    xor cx, cx  ;Limpio cx
    mov ch, dl  ;Muevo el valor obtenido de la suma a ch

    call regtoascii ;El valor de ch me lo llevo al regtoascci

    pop dx
    pop cx
    pop ax
     
ret
suma_puntaje endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA RESTAR EL PUNTAJE SI LA PREGUNTA ES INCORRECTA, INGRESA EL 
;PUNTAJE ACTUAL MEDIANTE BX DESDE EL MAIN, SE CONVIERTE A REGISTRO Y SE LE RESTA EL VALOR
;ELEGIDO, A LO ULTIMO LO VUELVO A CONVERTIR EN ASCII PARA VOLVER A MOSTRARLO EN PANTALLA
;MEDIANTE UN REGTOASCII
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

resta_puntaje proc
    
    push ax
    push cx
    push dx

    xor dx, dx       ;Limpio registros
    xor cx, cx
    xor ax, ax
    ;CONSIGO CENTENA
    mov al, [bx][0] ;MUEVO A AL EL OFFSET DE BX EN 0 
    sub al, 30h     ;CONVIERTO ESE DATO A NRO
    mov cl, 100     ;GUARDO EN CL LA CANTIDAD PARA MULTIPLICAR
    mul cl          ;MULTIPLICO
    add dl, al      ;GUARDO EL RESULTADO

    ;CONSIGO DECENA
    mov al, [bx][1]
    sub al, 30h
    mov cl, 10
    mul cl
    add dl, al 

    ;CONSIGO UNIDAD
    mov al, [bx][2]
    sub al, 30h
    add dl, al 

    cmp dl, 0
    je termino_puntaje

;SUMA DE PUNTAJE
    xor ax, ax  ;Limpio ax
    mov al, 10  ;Muevo el numero del puntaje a AL
    sub dl, al  ;Resto

    xor cx, cx  ;Limpio cx
    mov ch, dl  ;Muevo el valor obtenido de la suma a ch

    call regtoascii ;El valor de ch me lo llevo al regtoascci
	
termino_puntaje:
    pop dx
    pop cx
    pop ax
     
ret
resta_puntaje endp

;==================================================================================
;===== FUNCION QUE REPRODUCE UN SONIDO --  IN: CX = tone, BX = duration
;EN EL MAIN

;mov cx, 9121
;mov bx, 25
;call sonido
;==================================================================================

sonido proc
    push ax
    push cx
    push bx
    mov     ax, cx

    out     42h, al
    mov     al, ah
    out     42h, al
    in      al, 61h

    or      al, 00000011b
    out     61h, al

    pause1:
        mov cx, 65535

    pause2:
        dec cx
        jne pause2
        dec bx
        jne pause1

        in  al, 61h
        and al, 11111100b
        out 61h, al
        
    pop bx
    pop cx
    pop ax

    ret
sonido endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA MOSTRAR UN BMP EN PANTALLA
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

imagen proc
    mov ax, 13h
    int 10h

    ; Process BMP file
    call OpenFile
    call ReadHeader
    call ReadPalette
    call CopyPal
    call CopyBitmap

    ; Wait for key press
    mov ah,1

    int 21h
    
    mov ah, 0
    mov al, 2
    int 10h
;================================
exit:

imagen endp 
proc OpenFile

    mov ah, 3Dh
    xor al, al
    mov dx, offset filename
    int 21h

    jc openerror
    mov [filehandle], ax
    ret

    openerror:
    mov dx, offset ErrorMsg
    mov ah, 9h
    int 21h
    ret
endp OpenFile
proc ReadHeader

    mov ah,3fh
    mov bx, [filehandle]
    mov cx,54
    mov dx,offset Header
    int 21h
    ret
    endp ReadHeader
    proc ReadPalette

    ; Read BMP file color palette, 256 colors * 4 bytes (400h)

    mov ah,3fh
    mov cx,400h
    mov dx,offset Palette
    int 21h
    ret
endp ReadPalette
proc CopyPal

    ; Copy the colors palette to the video memory
    ; The number of the first color should be sent to port 3C8h
    ; The palette is sent to port 3C9h

    mov si,offset Palette
    mov cx,256
    mov dx,3C8h
    mov al,0

    ; Copy starting color to port 3C8h

    out dx,al

    ; Copy palette itself to port 3C9h

    inc dx
    PalLoop:

    ; Note: Colors in a BMP file are saved as BGR values rather than RGB.

    mov al,[si+2] ; Get red value.
    shr al,2 ; Max. is 255, but video palette maximal

    ; value is 63. Therefore dividing by 4.

    out dx,al ; Send it.
    mov al,[si+1] ; Get green value.
    shr al,2
    out dx,al ; Send it.
    mov al,[si] ; Get blue value.
    shr al,2
    out dx,al ; Send it.
    add si,4 ; Point to next color.

    ; (There is a null chr. after every color.)

    loop PalLoop
    ret
endp CopyPal

proc CopyBitmap

    ; BMP graphics are saved upside-down.
    ; Read the graphic line by line (200 lines in VGA format),
    ; displaying the lines from bottom to top.

    mov ax, 0A000h
    mov es, ax
    mov cx,200
    PrintBMPLoop:
    push cx

    ; di = cx*320, point to the correct screen line

    mov di,cx
    shl cx,6
    shl di,8
    add di,cx

    ; Read one line

    mov ah,3fh
    mov cx,320
    mov dx,offset ScrLine
    ;add dx,0
    int 21h

    cld 

    mov cx,320
    mov si,offset ScrLine
    rep movsb 

    pop cx
    loop PrintBMPLoop
    ret
endp CopyBitmap

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA FIJARSE CUAL DE LOS 2 JUGADORES OBTUVO MAS PUNTAJE, 
;LOS PUNTAJES ESTAN EN EL REGISTRO AL Y DL, VIENEN DESDE EL MAIN, Y DEPENDE DE CUAL
;ES MAYOR SE ELIJE AL GANADOR MOVIENDO A BX 1 O 0 PARA DESPUES MOSTRAR LOS CARTELES
;EN EL MAIN DEPENDIENDO LO QUE DEVOLVIO BX
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

ganador proc

	cmp al, dl
	je empate
	cmp al, dl
	jg ganador_1
ganador_2:
	mov bx, 1
	jmp fin_ganador
ganador_1:
	mov bx, 0
	jmp fin_ganador
empate:
	mov bx, 2

fin_ganador:
	
ret
ganador endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA PONERLE COLOR A UNA VARIABLE MEDIANTE EL OFFSET DE SI, EL COLOR
;SE ELIJE EN EL MAIN MOVIENDO A DL EL VALOR DEL COLOR
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

color proc
	push cx
	push ax
	push si
		
	arribac:
		cmp byte ptr[si], 24h
		je fin
		
		mov ah, 9
		mov al, byte ptr[si]
		mov bh, 0
		mov cx, 1

		int 10h
		mov ah, 2
		inc dl
		int 10h
		inc si
	jmp arribac
fin:
	pop si
	pop ax
	pop cx
ret
color endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;ESTA FUNCION SIRVE PARA SIMULAR LA CARGA DE UNA BARRA, LA BARRA LLEGARA A SU 100%
;CUANDO SI ALCANCE EL VALOR DE 50, A MEDIDA QUE SI AUMENTA VOY MOSTRANDO 
;LA VARIABLE QUE CONTIENE LA BARRITA.
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

carga_barra proc

	push ax
	push bx
	push cx
	push dx
	push si

	mov ah, 02h        ;POSICIONAR CURSOR PARA IMPRIMIR
  	mov bh, 0
   	mov dh, 12
    	mov dl, 6
    	int 10h

      xor si, si
      xor ax,ax   ;AL en 0
empieza_a_cargar:
     xor bx, bx   ;Inicializo BX en 0

hora_carga: 
      int 80h

      cmp bx, 1 ;En BX esta la cantidad de veces que se actualizo la hora, en este caso me fijo si se actualizo 10 veces DL
      je afuera_cargando  ;Si es igual, salto a imprimir la variable

      cmp al, dl ;Si los centisegundos son igual al valor que hay en AL
      je hora_carga    ;Si es igual, vuelvo a actualizar la hora, sino, sigue con el programa
      
      mov al, dl ;Muevo el valor de los centisegundos actuales a AL
      inc bx     ;Incremento BX en 1
      jmp hora_carga   ;Vuelvo a actualizar la hora

afuera_cargando:
  	
	mov ah, 9   ;Imprimo
	lea dx, barra_carga[si]
	int 21h 
  	inc si
  	cmp si, 50
  	je termina_cargar
	jmp empieza_a_cargar ;Vuelvo a empezar el ciclo

termina_cargar:

	pop si
	pop dx
	pop cx
	pop bx
	pop ax

ret
carga_barra endp

;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------
;CREDITOS: FABIO !!!!!! 
;
;ESTA FUNCION SIRVE PARA ORDENAR EN DOS VECTOR DE 19 POSICIONES CADA UNO, LAS 38 PREGUNTAS
;CARGADAS, LAS VA A DISTRIBUIR SEGUN EL NUMERO RANDOM GENERADO, CON ESE NUMERO SE ELIGIRA
;QUE POSICION DE LA VARIABLE "VECTOR" GUARDAR EN LA VARIABLE PREGUNTAS1 Y PREGUNTAS2, A MEDIDA
;QUE VA ALMACENANDO LOS DATOS EN LAS VARIABLES, EL VECTOR QUE LAS CONTIENE SE VA DISMINUYENDO SU LONGITUD EN 1
;GRACIAS A QUE EL VECTOR VA DISMINUYENDO Y QUITANDO LA PREGUNTA SELECIONADA EN LA POSICION QUE INDICO
;EL NUMERO ALEATORIO, LAS PREGUNTAS NUNCA SE VAN A REPETIR, YA QUE HAY SOLAMENTE UNA OPCION POR PREGUNTA.
;UNA VEZ COMPLETADO EL PROCESO DE SELECCION DE PREGUNTAS, LAS VARIABLES PREGUNTAS1 Y PREGUNTAS 2
;ME QUEDARAN TOTALMENTE CARGADAS CON LOS DATOS QUE SE SELECCIONARON.
;PARA UTILIZAR 38 VARIANTES, EL VECTOR USA LETRAS DEL ALFABETO MAYUSCULAS Y MINUSCULAS.
;-------------------------------------------------------------------------------------
;-------------------------------------------------------------------------------------

selecciona_preguntas proc
	
	push ax
	push bx
	push si
	push cx
	push dx

	mov long, 26h

	;---- Calculo la cantidad de preguntas por participante
	xor ax, ax
	mov al, Long	; AL=Cantidad total de preguntas
	mov cl, 2		; Divido por 2
	div cl
	mov byte ptr offset CantPregxP, al	; Determino la cantidad de preguntas por participante
										; Podía haber sido una constante con EQU

;---- Inicio bucle con cantidad de veces = Cantidad de preguntas por participante
	xor bx, bx
	mov bl, byte ptr Var1	; bx tiene la variable A

	otrapreg:

;---- Tomo el nro de pregunta de la posición aleatoria de "Vextor" y la guardo en las Preguntas del
;	  Participante
		;xor ax, ax
		;mov al, byte ptr Aleatorio	
		;mov si, ax					; SI=aleatorio entre 0 y long

		call RANDGEN	; En si hay un nro de 0 a Long
		
		mov al, byte ptr Vector[si]	; traigo el número de pregunta de la posición aleatoria
		mov di, bx					; en di, tengo el puntero a la próxima pregunta del participante a llenar
		mov byte ptr offset Preguntas1[di], al ; cargo ese nro de pregunta elegido en la pregunta del participante 1
		mov byte ptr offset Var1, bl; guardo la variable A en la memoria
	
;---- Inicio bucle para eliminar el item usado

		xor bx, bx
		mov bl, byte ptr Var2	; BX=variable J

		apilar:
			cmp bx, si			; Comparo la variable del bucle si coincide con posición del aleatorio
			jle noelimino		; Si no llegué, no hago nada
			mov al, Vector[bx]	; si llegué a esa posición, muevo los números restantes de Vector en 1
								; posición menos
			mov di, bx			; DI=posición del contador
			dec di				; una menos
			mov byte ptr offset Vector[di], al	; Piso el posterior con el anterior

		noelimino:
			inc bl					; incremento la variable del loop
			mov al, byte ptr Long
			cmp al,bl				; terminé de recorrer el vector? 
			jle salebucle			; si, paso al otro participante
			jmp apilar				; Sigo moviendo los contenidos del vector

	salebucle:
		xor ax, ax					; Terminé de recorrer el Vector
		mov al, byte ptr Long
		dec al						; Me quedó con un valor menos
		mov byte ptr offset Long, al; Actualizo la longitud de interés del Vector

;---- Bucle para pregunta 2
		;xor ax, ax
		;mov al, byte ptr Aleatorio	
		;mov si, ax					; otro aleatorio en si

		call RANDGEN	; En si hay un nro de 0 a Long
		
		xor bx, bx
		mov bl, byte ptr Var1	; bx tiene la variable A

		mov al, byte ptr Vector[si]	; traigo el número de pregunta de la posición aleatoria
		mov di, bx					; en di, tengo el puntero a la próxima pregunta del participante a llenar
		mov byte ptr offset Preguntas2[di], al ; cargo ese nro de pregunta elegido en la pregunta del participante 2
	
;---- Inicio bucle para eliminar el item usado
		xor bx, bx
		mov bl, byte ptr Var2	; bx tiene la variable J
	
		apilar2:
			cmp bx, si
			jle noelimino2
			mov al, Vector[bx]
			mov di, bx
			dec di
			mov byte ptr offset Vector[di], al
			
		noelimino2:
			inc bl
			mov al, byte ptr Long
			cmp al,bl
			jle salebucle2
			jmp apilar2
			
	salebucle2:
		xor ax, ax
		mov al, byte ptr Long
		dec al
		mov byte ptr offset Long, al
	
	xor bx, bx						; Limpio BX
	mov bl, byte ptr Var1			; BX=A del otro bucle
	inc bl							; Próximo
	mov byte ptr offset Var1, bl	; Guardo A incrementada en 1 en la memoria

	xor ax, ax			
	mov al, byte ptr CantPregxP		; Traigo la cantidad de preguntas

	cmp al, bl						; ¿Recorrí todas?
	jle salir						; Si, Terminé
	jmp otrapreg					; Continuo con el primer Participante
	
salir:


pop dx
pop cx
pop si
pop bx
pop ax

ret
selecciona_preguntas endp

RANDGEN proc         ; generate a rand no using the system time
	push ax
	push bx
	push cx
	push dx
	
	xor bx, bx
	MOV AH, 00h  ; interrupts to get system time        
	INT 1AH      ; CX:DX now hold number of clock ticks since midnight      

	mov ax, dx
	xor dx, dx
	xor cx, cx
	mov cl, byte ptr offset Long
	div cx       ; here dx contains the remainder of the division

	;add dl, '0'  ; to ascii from '0' to '9'
	mov si, dx
	;inc dl
	
	pop dx
	pop cx
	pop bx
	pop ax
	
	RET    
RANDGEN endp

end main