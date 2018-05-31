;redcode-94nop
;name Doughnut
;author Philip Thorne
;strategy 15Jun03 QS -> Paper. 
;strategy         A little too tasty. Kneads work.
;
;internal The QS if from Quilt35f. Is _not_ optimised for DN
;kill Doughnut
;assert 1

A       EQU     (1683)
B       EQU     (3779)
C       EQU     (5781)
G       EQU     (-345)

bBoot:
start:  spl     2,              <start-333
        spl     2,              {0
        spl     1,              <start-334

pap1:   spl     @0,             {A
        mov.i   }pap1,          >pap1
        mov.i   }pap1,          >pap1
        djn.f   pap2+A,         <G

        dat     0,              0
        dat     0,              0

    ;prefer non-mutating version but needs work on consts
pap2:   spl     @0,             <B
        mov.i   }pap2,          >pap2
        mov.i   {pap2,          <pap3
pap3:   djn     @0,             <C

;===
    for 51
        dat     0,              0
    rof

        dat     1,              qA
qTab1:  dat     1,              qB
        dat     0,0
        dat     0,0
        dat     0,0

        dat     0,0
        dat     0,0

        qX      equ     6612    ;Optimised to miss bombs (MSIZ) [NOT!]
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
        jmz.f   bBoot           , <qTab2

qDec    mul.b   *2,             qPtr
qSkip   sne     <qTab1,         @qPtr
        add.b   qTab2,          qPtr
qLoop   mov     qBomb,          @qPtr
qPtr    mov     qBomb,          }qX
        sub     #qStep,         @qSkip
        djn     qLoop,          #qTime
        djn.f   bBoot,          #0

        spl     1,              qC
qTab2:  spl     1,              qD
        spl     1,              qE

;--
    end qGo

