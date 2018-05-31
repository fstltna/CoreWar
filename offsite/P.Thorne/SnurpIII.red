;redcode-94m
;name Snurp III
;author Philip Thorne
;strategy Pared down zclearL. Less stun, more defense.
;bench current=100#2000 w=143#400 mps=98#250
;kill Snurp II
;assert 1

tsnurp  EQU     (zptr)
esnurp  EQU     (zbmb)

zptr:   spl     #sbmb,          tsnurp-esnurp+1000
        dat     0,              0
        dat     0,              0
        dat     0,              0
sbmb:   spl     #(zbmb-zptr),   <(esnurp-tsnurp)
snurp:  mov.i   *zptr,          >zptr
djnit:  djn.f   snurp,          {-20
        dat     0,              0
        dat     0,              0
zbmb:   dat     #(zbmb-zptr),   <(esnurp-tsnurp)

    end snurp-1

