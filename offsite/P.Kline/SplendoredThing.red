;redcode
;name SplendoredThing
;author P.Kline
;assert CORESIZE == 8000
;strategy spl/jmp bombing b-scanner
;strategy extended scanning for 1-million cycle challenge
;strategy onepass dat wipe finish


s2     equ    (2)
s1     equ    (10*256)
step   equ    (s1+s2)


attk   mov    jm1           ,@ptr
ptr    mov    spz           ,<2+step
scan   add    #step         ,ptr
       jmz    -1            ,@ptr     ; this one instruction detected 70 times
       slt    ptr           ,#11
       jmp    attk          ,0
       djn    scan          ,#70
spz    spl    0             ,0
       mov    2             ,<scan+1
jm1    jmp    -1            ,0


       end    scan+1
