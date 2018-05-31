;redcode-94nop verbose
;name Quest 35f
;author Philip Thorne
;strategy Piltdown based: QS -> 1SB -> Clear
;strategy 200211172349 Changed QS. Tweaked CLR for longer SPL phase.
;strategy 200211251943 35e. Bug-fix "dat 0" != "dat 0,0"
;strategy 200212161119 35f. Revised clear.
;kill Quest
;bench oct=135.18#8000 mps=143.4#250 w=163#250 o=156#400 lk=129.6#250

for CORESIZE==8000
 ;assert (CORESIZE==8000)
 ;assert (MAXLENGTH==100) && (MINDISTANCE==100)
 ;assert (MAXCYCLES==80000)
 ;assert (MAXPROCESSES==8000)
rof
for CORESIZE==55440
 ;assert (CORESIZE==55440) 
 ;assert (MAXPROCESSES>=8)
 ;assert (MAXCYCLES==500000)
 ;assert (MAXLENGTH==200) && (MINDISTANCE==200)
rof

for CORESIZE==8000
 STEP   EQU     (2936)          ;mod-8 2912
rof
for CORESIZE==55440
 STEP   EQU     (24184)         ;mod-8
rof

MSIZ    EQU     (8)
MSPACE  EQU     for MSIZ
        EQU         dat 0, 0
        EQU     rof
MFILL   EQU     for MSIZ-(CURLINE%MSIZ)
        EQU         dat 0, 0
        EQU     rof

DROP    EQU     (lure-4000-STEP)
WATCH   EQU     (lure+STEP)

WACK    EQU     cptr

;assert ((STEP%(MSIZ)) == 0)
;assert ((CURLINE%MSIZ) == 0)


lure:   mov.b   #(2*STEP),      *(WATCH-(2*STEP))
inc:    spl     #(STEP-1),      #(-STEP-1)
vbmb:   djn.f   -(MSIZ),        {6     ;
        MFILL

;assert ((CURLINE%MSIZ) == 0)

        DAT	0,		0
loop:   mov.i   @1,             }lure   ;A==lure
        mov.i   vbmb,           >lure
        add.f   inc,            @-1     ;B==lure
eloop:  jmz.b   loop,           DROP    ;misses WATCH overruns
        spl     clr,            DROP
prep:   sub.b   @-1,            WACK

        MFILL

;assert ((CURLINE%MSIZ) == 0)

    for MSIZ-1-1
        dat     0,              0
    rof
cptr:   dat.f   cptr+1,         (WATCH-WACK-1)  ;Was B==15
        dat     0,              0

;assert ((CURLINE%MSIZ) == 0)
        dat     0,              0
        dat.f   <-15,           >2667
        dat.f   <-15,           20
clr:    spl     #-2400,         30
        mov.i   @2,             >cptr
        mov.i   @1,             >cptr
        djn.b   -2,             {clr

        MFILL

;assert ((CURLINE%MSIZ) == 0)

        ;MSPACE
        MSPACE
        MSPACE
        MSPACE
        MSPACE

;assert ((CURLINE%MSIZ) == 0)

        dat     1,              qA
qTab1:  dat     1,              qB
        dat     0,0
        dat     0,0
        dat     0,0
bBoot:
start:  mov.a   #(DROP-WATCH),  WATCH
        jmp     loop,           {0

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

