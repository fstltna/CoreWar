;redcode
;name Infiltrator
;author inversed
;strategy Self-replicating stone/scan
;strategy Or a scanning/bombing replicator?
;strategy Valentine tournament 2015 version
;assert (CORESIZE==8000)

len     equ     23
len0    equ     15
step    equ     2946
hop     equ     11
sofs    equ     1588
pofs    equ     2388
ikill   equ     2667

from    mov     # len       ,     len0
loop    add     # step+1    ,     ptr
        mov       bomb      ,   < ptr
ptr     jmz       loop      ,   < sofs+1
copy    mov       bomb2     ,   < ptr
        mov     < from      ,   < pptr
        jmn       copy      ,     from
        spl       from      ,     0
pptr    jmz     @ 0         ,     pofs+len
bomb2   dat     < ikill     ,   < 2*ikill
bomb    dat     < ikill     ,   <-hop+1

end     loop+1
