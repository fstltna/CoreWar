;redcode-94m
;name Ossilaslurp
;author Philip Thorne
;strategy Oscillating, pared down zclear.
;kill Ossilaslurp
;assert 1

tossil  EQU     (ossil)
zptr    EQU     (ossil)

ossil:  spl     #zbmb2,         <(eossil-tossil) +2
        mov.i   *zptr,          >zptr
        djn.f   ossil+1,        <zptr-12; 200
zbmb:   dat     #zbmb2-zptr,    <(eossil-tossil) +6
zbmb2:  spl.a   #zbmb -zptr,    <(eossil-tossil) +6;+1 
zbmb3:  dat     0,              0   ;wacked this

eossil EQU     zbmb3

    end ossil

