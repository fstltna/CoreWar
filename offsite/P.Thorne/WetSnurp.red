;redcode-94m verbose
;name Wet Snurp
;author Philip Thorne
;strategy imp-cowardly Snurp clear variant
;bench current=102.8#2000 w=143#400 mps=89#250 o=105#250
;kill Snurp
;assert 1

STEP    EQU     -400

tsnurp  EQU     (zptr)
esnurp  EQU     (zbmb)

zptr:   spl     #sbmb,          tsnurp-esnurp+300
        dat     0,              0
        dat     0,              0
        dat     0,              0
sbmb:   spl     #(zbmb-zptr),   <(esnurp-tsnurp)
snurp:  mov.i   *zptr,          >zptr
djnit:  djn.f   snurp,          {-20
        dat     0,              0
        dat     0,              0
zbmb:   dat     #(zbmb-zptr),   <(esnurp-tsnurp)

    for MAXLENGTH-CURLINE-3
        dat     0,              0
    rof

start:  spl     snurp-1
wimp:   jmp     #0,             <-150

    end start

