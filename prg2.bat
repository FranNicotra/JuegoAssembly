@ECHO OFF

tasm int80.asm
tlink /t int80
int80
tasm maintp.asm
tasm libtp.asm
tlink maintp libtp

maintp