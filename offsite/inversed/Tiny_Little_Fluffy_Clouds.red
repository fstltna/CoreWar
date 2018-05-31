;redcode-tiny
;name Little Fluffy Clouds
;author inversed
;strategy qbomb -> paper
;assert CORESIZE==800

; Basic coreclear-style paper optimized against oneshots and scanners.
; Does its job fairly well, as most scanning warriors score less than
; 120 points against it.

len     equ       6
ofs1    equ     480
ofs2    equ     136
bofs1   equ      87
bofs2   equ     172
bofs3   equ     610

bdist   equ     760
decoy   equ     300
bdest   equ     x0 + bdist + len
scratch equ     x0 + decoy + len

x0      mov     { x0 + 316  ,     x0 + 183
        mov     { x0 + 399  ,     x0 + 748
        mov     { x0 + 452  ,     x0 + 322
        mov     { x0 + 472  ,     x0 + 468
        mov     { x0 + 285  ,     x0 + 341
        mov     { x0 + 137  ,     x0 + 671
        mov     { x0 + 449  ,     x0 + 386
        mov     { x0 + 155  ,     x0 + 200
        mov     { x0 + 205  ,     x0 + 164

        spl       2         ,   { x0 + 107
        spl       1         ,   { x0 + 258
        spl       1         ,   { x0 + 571

        mov     { silk1     ,   { bptr
bptr    djn.f     bdest     ,   < scratch

silk1   spl     @ len       ,   > ofs1
        mov     } silk1     ,   > silk1
silk2   spl     @ 0         ,   > ofs2
loop    mov     } silk2     ,   > silk2
        mov.i   # bofs1     ,   } bofs2
        djn.f     loop      ,   < bofs3

