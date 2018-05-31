;redcode-94m
;name Snurp II
;author Philip Thorne
;strategy Pared down zclear.
;kill Ossilaslurp
;kill Snurp II
;assert 1

tsnurp  EQU     (snurp)
zptr    EQU     (snurp)

snurp:  spl     #zbmb2,         <(esnurp -tsnurp ) +2
        mov.i   *zptr,          >zptr
        djn.f   snurp+1,        <zptr-12; 200
zbmb:   dat     #zbmb -zptr,    <(esnurp -tsnurp ) +6
zbmb2:  spl.a   #zbmb -zptr,    <(esnurp -tsnurp ) +6;+1 
        dat     0,              0   ;zbmb3 lived here
        dat     0,              0   ;fluff

esnurp  EQU     (zbmb2+1)

    end snurp

