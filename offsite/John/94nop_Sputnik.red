;redcode-94nop
;name Sputnik
;author John Metcalf
;strategy qscan -> paper with satellite
;assert CORESIZE==8000

       org    qscan

       step   equ 3416
       dist   equ 1234
       bpos   equ satel+4-dist+1

