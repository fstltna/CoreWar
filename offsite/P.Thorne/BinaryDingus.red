;redcode
;name   Binary Dingus
;author Philip Thorne
;
;strategy Fizmo's Redcoders Frenzy [Limited Value] Entry #1/1
;strategy
;strategy   Imp/Stone (plus safety wimp for r1 and if BW detected).
;strategy   Calcs constants one, or if brain-wash detected, storing
;strategy   them in pspace. Runs a wimp if BW detected for safety.
;strategy
;strategy   It took too much space (&time) to calculate the constants 
;strategy   for both imp and stone so only the imp (written first) is
;strategy   booted which is kind-of-back to front but the imp is huge
;strategy   [71pt] so must be booted.
;strategy   
;strategy   Lessons learnt:
;strategy       a) don't leave binary conversion to end
;strategy       b) it's easier to manipulate code from ahead of it
;strategy          in core (because the offsets are more stable).
;
;assert (CORESIZE==55440) && (MAXCYCLES==100000)

ISIZE   EQU     0 ;10151
mTHREE  EQU     0
mFOUR   EQU     0
IDOFF   EQU     0 ;Imp djn's offset
IMP     EQU     0 ;5
STONE   EQU     0
IBOOT   EQU     -1

for 0
PIN     303
;Split rounds with other entrant [my only entrant :-(]
Hshake: stp.ab  #-1,            #-1
        ldp.ab  #-1,            #0
        seq.ab  *-1,            -1
        dat     0,              0
rof

;P-Space
; -1: Handshake, reuse
;  1: StoneCodeOffset
;  2: ImpStep
;  3: StoneStep

Pchk1:  ldp.ab  #1,             }0
        sne.i   @1,             <0      ; B==StoneCodeOffset
        spl     @-1,            }1      ; Split to stone code. Trust PS.
        mul.a   #1,             #0      ; 1,0 - 1,0 - 1,0 or
                                        ; 1,0 - 2,0 - 4,0 - 16, 0
        mul.a   -1,             -1
        mov.ab  *-1,            }1
        add.ab  #1,             #1
        mul.b   -1,             #1
        jmp     @-1,            >1      ; Either +2 or +47

    ;-
        dat     $0,             $0      ; FB

    ;Calc imp/stone steps for p-store

        ;Calc/store offset to stone launch code
        add.f   #1,             $1
        mul.f   #1,             #1      ; 1,1 - 2,2 - 4,4 - 4,16 - 4,64
        mul.b   -1,             -1
        mul.ab  *-1,            *-1

        mov.b   {-1,            @1
        add.b   $1,             $1      ; 0,64 - 0,128
        spl     @0,             0       ; --> stone / wimp launch (+14)
        stp.b   -1,             #-1     ; TEMP store in -1

        ;Calc/store imp-step
        ;   10151 ==  2 5 5 7 29 + 1 == 2 2 2 3 3 3 47 - 1
        add.f   #1,             1
        mul.f   #1,             #1      ; 2,2 - 4,4 - 3,4 - 12,4
        nop     {-1,            0
        mul.ba  *-1,            *-1
        mov.f   {-1,            #0      ; 12,4 - 12,48 - 12,576
        mul.ab  -1,             -1
        mul.ab  *-1,            *-1
        mov.f   {-1,            0       ; 12, 576 - 12,564 (need 2.3.3)
        sub.ab  -1,             -1
        mov.b   *-1,            >1
        add.ba  #1,             #1      ; 3,2
        mul.ab  -1,             #0      ; -1,564 - -1,1692 -1,5076, -1,10152
        mul.ab  *-1,            -1
        add.b   *-1,            *-1
        mov.b   {-1,            #0      ; -1, 10152 - -1,10151
        nop     <-1,            >1
        stp.b   *-1,            #1      ; Store imp-step

        ;Calc/store stone-step
        ;   -3478 == 2 37 47 == (128 27) + (2 11)
        add.f   #1,             }1
        add.f   #1,             1
        mul.ab  #1,             #1      ; 1,1 - 2-2 - 4-3 - 4,12 - 4,24 - 4,28
        add.b   -1,             -1
        add.ab  *-1,            *-1

        mov.b   {-1,            1
        nop     <0,             #0      ; 0,28 - 0,27
        ldp.ab  #-1,            #0      ; -1,0 - -1,128 - -1,3456 - 3483
        mul.b   *-1,            -1
        add.b   {-1,            @-1

        mov.b   {-1,            #0      ; -1,3483 - -4,3483 - -4,3479
        add.a   {-1,            -1
        add.ab  *-1,            *-1     ; -1,-1 - -2,-1

        mov.b   {-1,            #0      ; -1,3479 - -1,3478
        nop     <-1,            {0      ; -1,0 - -2,0 - -2,-1

        mov.ba  <-1,            }1
        add.ab  #1,             #1
        stp.ab  #0,             $-1     ; Store stone-step

        ;Relocate P-1 to P1 for BW protection
        ldp.a   #-1,            $1
        stp.ab  #0,             #1

    ;-
    ;At this point stone prep is underway and have imp-number
for 0
        ;Firebreak
        nop     }1,             }1
        jmp     1,              0
        dat     0,              0
        dat     0,              0
rof
    ;Place imp-number's

        ;set ai.A
iBegin: nop     >1,             >1
        ldp.ab  #1,             $1
        div.b   -1,             @1
        sub.b   *-1,            1
        nop     }1,             #0      ; 1,0 1,128 1,42 1,39
        ldp.a   #1,             @-1

        ;set ji.A
        ldp.ab  #1,             #0
        mod.b   -1,             }1
        mul.ab  #1,             1       ; 1,1 - 2,1
        nop     <0,             #-1     ; 0,-1 - 0,15 - 0,30 - 0,29
        nop     }-1,            }-1

        ldp.ab  *-1,            >1
        mov.b   {-1,            @1
        sub.b   -1,             #0      ; B==ImpNumber
        nop     <-1,            1
        sub.ba  *-1,            $0

        ;set imp.B
        ldp.ab  #1,             #0
        mod.b   -1,             @1
        add.f   1,              1
        ldp.ab  #1,             $-1     ; Need A==2 B==28[+2]
        nop     0,              0
        nop     0,              0

    ;Boot & launch imp

        ;set j.A
sj:     add.ab  #1,             #1      ; 1,2
        add.f   -1,             1       ; 
        add.f   #1,             #1      ; 2,3 - 4,6 - 4,12
        add.b   -1,             -1
        add.f   *-1,            $1      ;
        mul.a   #0,             1       ; 4,13 set j

        ;set ib.A ib.B
        nop     -1,             #0
        add.a   *-1,            @1
        add.ba  {-1,            *1
        div.ab  #1,             *0      ; 5,0

        ;spl to 9
        spl     1,              #0      ; >1
        mov.i   -1,             #0
        mov.i   -1,             #0
        mov.i   -1,             #0

        ;boot 9, spl to 36, jmp
ib:     nop     $1,             <IBOOT  ; <== A == 14, IBOOT == -1/5 ok
        mov.i   {-1,            <-1     ; copy 9
        spl     1                       ; 18
        spl     1                       ; 36
j:      jmp     @-1,            }1      ; B to break template <== ok

        ;-- 9 
        spl     $1,             0
        spl     #0,             0
ai:     add.a   #ISIZE,         1       ; <==  A==  10151
ji:     jmp.b   IMP-ISIZE-1+(2),0       ; <==  A== -10147 B=? [no djn]
        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0
imp:    mov.i   #1,             $ISIZE  ; <==  B==  10151
        ;--
        dat     0,              0

;---
    for 9
        dat     0,              0
    rof
bmb:    dat     >-1,            0
    for 7
        dat     0,              0
    rof
;---

;### Stone section
SSTEP   EQU     0 ;-3478
SOFF    EQU     SSTEP
DOFF    EQU     IDOFF
BMB     EQU     0

stone:  spl     #0,             {-1
sm1:    mov.i   *1,             }SOFF-1 ;
sm2:    mov.i   BMB,            @-1
        add.b   *-1,            @-1
sd:     djn.f   @-1,            <-1     ; Need A==2, Want B=-1/2

    ;Place stone-consts

Pchk2:  mul.a   #1,             #0      ; for BW seq check. Shouldn't execute.
Sbegin: add.a   <-1,            @0      ; -1,0 -1,-1 -1,-2 -1/2,-2  set sd.A

        sub.ab  #1,             }1
        sub.ab  #1,             #-1
        add.b   -1,             #-1
        div.ab  *-1,            @-1     ; set sd.B

        mov.b   *-1,            1
        add.b   #1,             #0      ; 0,0 0,-5 0,-10
        mov.ba  -1,             @-1     ; set sm2.A

        ldp.a   #1,             #-1     ; 1,-1 128,-1
        mod.ab  -1,             }1
        add.ab  #1,             #1      ; 1,1 2,1 2,3
        add.b   -1,             #-1     ; -1,-1 -1,15 -1,18 -1,-18
        mul.ab  -1,             -1
        ldp.b   {-1,            #0      ; -1,0 -1,3478
        mov.b   {-1,            #0

        add.b   *-1,            <-1     ; set sm1.B

    ;Launch wimp [1st round or brainwashed] - entry is prev instruction
Wbegin: mul.b   @-1,            #-1
        jmn.b   <-1,            -1

        nop     }1,             }1
        sub.ab  #1,             @1
        jmp     *1,             }1
wimp:   jmp     #1,             >-1
        div.ab  -1,             $1
        mov.i   *-1,            $-1
        jmp     @-1,            }0

    for 9
        dat     0,              0
    rof

    ;Create bomb / Launch stone [no time/room to boot :-(]
    ; bmb is 48 behind Scont
Scont:
        jmp     *1,             {1      ; Not so elegant.
        dat     1,              0       ; FB
        nop     1,              0

        ldp.ab  #1,             }1
        div.ab  #1,             $1      ; 1,1 2, 1
        mul.ab  #-1,            #0      ; -1,0 -1,128 -1,64 -1,-64 -1,60
        mul.a   *-1,            *-1
        add.ab  {-1,            @-1

        mov.ba  <-1,            }1
        add.a   #1,             @1
        mov.ab  #0,             @1
        ldp.ab  #1,             @1      ; set bmb.B (STEP)
        nop.x   #0,             #0      ; B is pointer to bmb
        div.a   {-1,            @-1     ; This gives -1/3

        ;Start it up
        mov.b   @-1,            }1
        add.ab  #1,             #1
        add.ab  -1,             #0      ; ptr to stone SPL
        add.ab  *-1,            {1

        ;Stone pump
        spl     @-1
        spl     -1,             >1
        jmp     -1,             >1

    end Pchk1
    end Hshake

