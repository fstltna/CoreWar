;redcode
;name Monolith
;author inversed
;strategy Scanner
;strategy Valentine tournament 2015 version
;assert (CORESIZE==8000)

step    equ     (2*245+1)*16
hop     equ     8
zofs    equ     step
wlen    equ     15
cptr    equ     ptr+hop+overlap
xptr    equ     attack
xp2     equ     attack+1
overlap equ     3
stream  equ     4000
ikill   equ     2667

x0      equ     boot
bd      equ     430*16+11
len     equ     13

boot    mov     < 22        ,   < 6
for len
        mov     < inc+1     ,   < bp
rof
bp      jmp       x0+bd+5   ,     x0+bd+len
        dat     # 0         ,   # 0
        jmn      -3         ,   @-3

attack  mov     # wlen      ,     cnt
        mov       ptr       ,     cptr
wipe    mov       bomb      ,   < cptr
cnt     djn       wipe      ,   # wlen
loop    add       inc       ,     ptr
ptr     cmp       zofs+hop  ,     zofs
        jmn       attack    ,   @ loop
        jmn       loop      ,   @ loop
bomb    spl       0         ,   < xp2
clear   mov       kill      ,   < xptr
        djn       clear     ,   < stream
kill    dat     < ikill     ,   < xp2-bomb-1
inc     add       step      ,     step

end     boot+1
