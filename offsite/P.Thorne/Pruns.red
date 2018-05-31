;redcode-94m
;name Pruns
;stratgey Snurp backwards
;author Philip Thorne
;kill Pruns
;assert 1

tpruns  EQU     sbmb
epruns  EQU     zptr
DJOF    EQU     50

sbmb:   spl     #(zbmb-zptr),   <(tpruns-epruns)
pruns:  mov.i   *zptr,          <zptr
djnit:  djn.f   pruns,          {-20
zbmb:   dat     #(sbmb-zptr),   <(tpruns-epruns)
        dat     0,              0
        dat     0,              0
zptr:   spl     #sbmb,          tpruns-epruns-1000

    end pruns-1

