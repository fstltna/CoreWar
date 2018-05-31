;redcode-94m
;name Snurp Va
;author Philip Thorne
;strategy I:   Oscillating, pared down zlcear [Ossilaslurp]
;strategy II:  Pared down zclearL
;strategy III: Pared down zclearL. Less stun, more defense.
;strategy IV:  imp-cowardly Snurp clear variant [WetSnurp]
;strategy V:   More aggressive vs imps. Va: QS
;kill Snurp
;assert 1

tsnurp  EQU     (zptr)
esnurp  EQU     (ibmb+3)

zptr:   spl     #tsnurp-esnurp+100, sbmb
zbmb:   dat     #(esnurp-tsnurp),   (zbmb-zptr)
        dat     0,              0
        dat     0,              0
        dat     0,              0
sbmb:   spl     #(esnurp-tsnurp),   (ibmb-zptr)
snurp:  mov.i   @zptr,              }zptr
djnit:  djn.f   snurp,              <-20
        dat     0,              0
        dat     0,              0
ibmb:   mov.i   #(esnurp-tsnurp),   <1

    for MAXLENGTH-CURLINE-(MAXLENGTH-64)
        dat     0,              0
    rof

        dat     1,              qA
qTab1:  dat     1,              qB
        dat     0,0
        dat     0,0
        dat     0,0

        dat     0,0
        dat     0,0

        qX      equ     6612    ;Optimised to miss bombs (MSIZ)
        qA      equ     3762
        qB      equ     2253
        qC      equ     1965
        qD      equ     456
        qE      equ     6947
        qF      equ     1199

        qStep   equ     7       ;Weighted towards liklihood
        qTime   equ     16      ;of hitting late in warrior
        qOff    equ     32      ;body due to QS's.

qBomb   dat     {qOff           , qF

qGo     sne     qPtr+qX*qE      , qPtr+qX*qE+qE
        seq     <qTab2+1        , qPtr+qX*(qE-1)+(qE-1)
        jmp     qDec            , }qDec+2
        sne     qPtr+qX*qF      , qPtr+qX*qF+qD
        seq     <qBomb          , qPtr+qX*(qF-1)+qD
        jmp     qDec            , }qDec
        sne     qPtr+qX*qA      , qPtr+qX*qA+qD
        seq     <qTab1-1        , qPtr+qX*(qA-1)+qD
        djn.a   qDec            , {qDec
        sne     qPtr+qX*qB      , qPtr+qX*qB+qD
        seq     <qTab1          , qPtr+qX*(qB-1)+qD
        djn.a   qDec            , *0
        sne     qPtr+qX*qC      , qPtr+qX*qC+qC
        seq     <qTab2-1        , qPtr+qX*(qC-1)+(qC-1)
        jmp     qDec            , {qDec+2
        sne     qPtr+qX*qD      , qPtr+qX*qD+qD
        jmz.f   snurp-1         , <qTab2

qDec    mul.b   *2,             qPtr
qSkip   sne     <qTab1,         @qPtr
        add.b   qTab2,          qPtr
qLoop   mov     qBomb,          @qPtr
qPtr    mov     qBomb,          }qX
        sub     #qStep,         @qSkip
        djn     qLoop,          #qTime
        djn.f   snurp-1,        #0

        spl     1,              qC
qTab2:  spl     1,              qD
        spl     1,              qE

;--
    end qGo

