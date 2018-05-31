;redcode
;name Triangular Sun
;author inversed
;strategy QScan -> Stone/Imp
;strategy Using Imprimis 6's anti-imp technique
;assert (CORESIZE==8000) && (MAXPROCESSES==8000)

;----- [ Boot ] -------------------------------------------;
bds     equ     6114    ; Stone boot distance
bdi     equ     6132    ; Imp launcher boot distance
iofs    equ      798    ; Imp offset
x0      equ     boot

boot    mov       inc   ,     x0+bds+5
itmp    mov       imp   ,     x0+bdi+iofs+4
        mov       imp   ,   < itmp
        mov       imp   ,   < itmp
        spl       1     ,     0
        spl       1     ,     0
        mov     < s0    ,   < bps
        mov     < is0   ,   < bpi
        djn     @ bps   ,   # 1
bpi     jmp     @ 0     ,     x0+bdi+6

;----- [ Stone ] ------------------------------------------;
; Technique from  Imprimis 6:  use imp step  for the stone's
; a-filed,  effectively forming three decrement streams that
; will kill  3-point imps.  Mod-2  "true"  step for  maximal
; duration. After  being  hit  with  the  stream, the  stone
; transforms into an add-clear.

zdec    equ     s0-(ikill/2)+16
za      equ     zdec+ikill
zb      equ     1+step
ikill   equ     2667
step    equ     2366
stream  equ     5650

s0      spl       0     ,     4
ptr     mov     < za    ,     zb
        add       inc   ,     ptr
        djn       ptr   ,   < s0+stream
        dat     # 0     ,   # 0
inc     dat     < ikill ,   # step

;----- [ Imp launcher ] -----------------------------------;
istep   equ     2667

imp     mov       0         ,     istep
bps     dat     # 0         ,   # x0+bds+4

is0     spl       0         ,     4
        add     # istep + 1 ,     iptr
iptr    jmp     @ 0         ,     is0+iofs-istep-1

;----- [ Quickscan ] --------------------------------------;
qs      equ     3841
qd      equ     4000
qbinc   equ     (-9)
qbhop   equ     43
qbtime  equ     6
nil     equ     boot+100

qscan   cmp     2*qs+qd         ,         2*qs
qt1     jmp     qa0             ,       < 3*qs
        cmp     qscan+ 5*qs+qd  ,         qscan+ 5*qs
qt2     jmp     qa1             ,       < 4*qs
        cmp     qscan+ 4*qs+qd  ,         qscan+ 4*qs
qs1     djn     qa1             ,       # qt1
        cmp     qscan+10*qs-2   ,         qscan+10*qs+qd-2
qs2     djn     qa2             ,       # qt2
        cmp     qscan+ 9*qs+qd  ,         qscan+ 9*qs
qt3     jmp     qa2             ,       < 6*qs
        cmp     qscan+ 6*qs+qd  ,         qscan+ 6*qs
        jmp     qa2             ,       < qa1
        cmp     qscan+ 8*qs+qd  ,         qscan+ 8*qs
        jmp     qa2             ,       < qs1
        cmp     qscan+11*qs     ,         qscan+11*qs+qd
        jmp     qa3             ,       < qa2
        cmp     qscan+18*qs-8   ,         qscan+18*qs+qd-8
qs3     djn     qa3             ,       # qt3
        cmp     qscan+16*qs-2   ,         qscan+16*qs+qd-2
        jmp     qa3             ,       < qs2
        cmp     qscan+12*qs     ,         qscan+12*qs+qd
        jmp     qa3             ,       < qa1
        cmp     qscan+14*qs     ,         qscan+14*qs+qd
        jmp     qa3             ,       < qs1
        jmz     boot            ,         qscan+15*qs

qa3     add     @ qs3           ,         qp
qa2     add     @ qs2           ,       @ qa3
qa1     add     @ qs1           ,       @ qa3
qa0     cmp     @ qp            ,         nil
        cmp     @ 0             ,         0
        add     # qd            ,         qp
ql      mov       qbomb         ,       @ qp
qp      mov       nil           ,       < qscan+2*qs
        add     # qbinc         ,       @ ql
        djn       ql            ,       # qbtime
        jmp       boot          ,         0
qbomb   dat     # 0             ,       # qbhop

end     qscan
;----------------------------------------------------------;
