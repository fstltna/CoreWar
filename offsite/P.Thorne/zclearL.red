;redcode-94m verbose
;name zclearL (94m)
;author Philip Thorne
;bench w=126 (200) mp=76#200 current(10)=78#250
;kill zclearL
;assert CORESIZE==8000

tzclear EQU     (zclear)
zptr    EQU     (zclear)

zclear: spl     #zbmb3,         <(ezclear-tzclear) +2
        mov.i   *zptr,          >zptr
        djn.f   zclear+1,       <zptr-12; 200
zbmb:   dat     #zbmb -zptr,    <(ezclear-tzclear) +6
zbmb2:  spl.a   #zbmb -zptr,    <(ezclear-tzclear) +6;+1 
zbmb3:  spl     #zbmb2-zptr,    <(ezclear-tzclear) +6

ezclear EQU     zbmb3

    end zclear

