;redcode-tiny
;name Yukikaze
;author inversed
;strategy Stone + Imp
;assert CORESIZE == 800
;date submitted: 2015.01.06

; The stone is 1/3c, with the mov.i #1, {1  bomb being a part of the loop. The
; idea was taken from  Dwarfia Hyemalis, which was evolved with RedShift  from
; a silkdwarf-seeded population. The stone may be hard to  work  with  because
; there is no clear bombing pattern. Sometimes the mov executes twice in a row,
; ruining the global pattern alignment. But thanks to this  feature, the stone
; can cover the core almost completely when properly tuned.

; Silk-based imp launcher a-la  Silent Snowfall  is employed. But there  is  a
; weird modification discovered by accident. Djn to the silk decrements itself
; on its second  execution. As a result, the imp launcher is fed with  only  2
; processes. The resulting "spiral" has 11 processes.

step    equ     615
sofs    equ     611
istep   equ     267
bds     equ     586
bdi     equ     66
stream  equ     149
scratch equ     19

qba     equ     x0+qao+(i-1)*qas
qbb     equ     x0+qbo+(i-1)*qbs
qao     equ     354
qbo     equ     762
qco     equ     212
qas     equ     (-20)
qbs     equ     (-23)
qcs     equ     (-117)

x0      equ     (-CURLINE)
org     imp+1

silk    spl     @ 4         ,   < istep+1
       mov     } silk      ,   > silk
       spl       2*istep   ,   } 0
imp     mov.i   # istep/2   ,     istep

i for   6
       mov     { qba       ,     qbb
rof

       spl       1         ,   { x0+qco+0*qcs
       spl       1         ,   { x0+qco+1*qcs
       mov     { silk      ,   { bpi
       mov     { stone     ,   { bps
bps     spl       x0+bds+4  ,   { x0+qco+2*qcs
bpi     djn.f     x0+bdi+4  ,   { xx

stone   spl     # 4         ,   { stream
loop    mov.i   # 1         ,   { 1
       add.ba  # sofs      ,   # step+1
xx      jmp       loop      ,   > stone

