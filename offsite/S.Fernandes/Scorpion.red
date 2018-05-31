;redcode
;name Scorpion
;author S.Fernandes
;strategy scanner

;assert CORESIZE == 8000

step    equ     2032
offset  equ     step
sep     equ     8
count   equ     494
target  equ     shades+13

loop    add     inc         ,    shades
shades  cmp     offset+sep  ,    offset
aim     mov     shades      ,    target
        mov     sbmb        ,    <target
        djn     loop        ,    #count
sbmb    spl     0           ,    0
clear   mov     cleanup     ,    <target
        djn     clear       ,    <-2680
cleanup dat     <2667       ,    <-15
inc     dat     <step       ,    <step
        end     aim