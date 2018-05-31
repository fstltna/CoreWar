;redcode-94nop verbose
;name zclear v504671
;author Philip Thorne
;strategy test comp for useless warrior the n'th
;kill
;assert CORESIZE==8000

;== zclear =======================================
tzclear EQU     (zclear-1)
zptr    EQU     (zclear-1)

        spl     #zbmb,          >(ezclear-tzclear)+2
zclear: spl     1,             #0
        mov.i   *zptr,          >zptr
        jmp     zclear+1,       >zptr
zbmb:   spl     zbmb2-zptr,    >(ezclear-tzclear)+4-1
zbmb2:  spl     zbmb3-zptr,    >(ezclear-tzclear)+4-1
zbmb3:  dat     #zbmb3-zptr,   >(ezclear-tzclear)+4-1+6

ezclear EQU     zbmb3
;=================================================

for 90
    dat 0,      0
rof

start   spl     1
        mov.i   -1,             0
        jmp     zclear

end start

