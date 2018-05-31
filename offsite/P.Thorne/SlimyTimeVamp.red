;redcode
;name Slimy Time Vamp
;author Philip Thorne
;strategy John Metcalf 2002 Tournament Round 2, Warrior 1
;strategy Qbomb (restricted range)/Vamp (dual pit)/Clear(s)
;assert (CORESIZE==55440) 
;assert (MAXPROCESSES==8)
;assert (MAXLENGTH==200) && (MINDISTANCE==200)

STEP    EQU     (-12104)
ANTIMP  EQU     34117

MSIZ    EQU     (8)
PTR     EQU     (fang+STEP)
MSPACE  EQU     for MSIZ
        EQU         dat 0,  0
        EQU     rof

inc     EQU     pit

;assert (STEP % MSIZ) == 0

SA      EQU     (STEP*(CORESIZE/MSIZ)/2)
fang:   jmp     *STEP-(fang-PTR)+SA,   -STEP-SA
vamp:   mov.i   fang,               >fang
        mov.i   vbmb,               }fang
        add.f   inc,                fang
        jmz     vamp,               PTR
        spl     sclr
cptr:   jmp     dclr,             (fang+MAXLENGTH+1) + (CORESIZE/4)
        dat     0,                  0
;==
        MSPACE
        MSPACE
;===
tsclear EQU     (sclr)
sptr    EQU     (sclr)

        dat     0,              0
sclr:   spl     #sbmb2,         <((dclr+2)-tsclear) + (MAXLENGTH)
        mov.i   *sptr,          >sptr
        djn.f   -1,             <sptr-((dclr+2)-tsclear)-4
        jmp     -1
sbmb:   dat     #sbmb -sptr,    <((esclear)-tsclear) + 2+1
sbmb2:  jmp     #sbmb -sptr,    <((dclr+2)-tsclear) + 2+1
        dat     0,              0

esclear EQU     sbmb2
;===
        MSPACE
;==
        dat     0,                  0
dptr:   dat     0,                  >((dclr-dptr+3)+ (MAXLENGTH-dclr))
        dat     0,                  0
dbmb:   dat     <ANTIMP,            >((dclr-sptr)+3)
        dat     0,                  0
dclr:   mov.i   dbmb,               >dptr
        jmp     dclr,               >sptr
        dat     0,                  0
;===
        MSPACE
;===
;The pits are mostly passive to reduce accidental overruns.
        dat     0,                  0
        dat     0,                  0
        dat     0,                  0
pit:    spl     #STEP-1,            #-STEP-1
        spl     pit2,               >PTR
        spl     #0,                 #0
rip:    spl     -1,                 {(CORESIZE/4)
        spl     -1,                 >-1 ;Next cell is bombed to close pit
;==
        MSPACE
;==
;Second pit incase first hit/cut-short. Small to drive 'rip'
        dat     0,                  0
pit2:
        spl     #0,                 #0
        spl     -1,                 >rip
        jmp     pit2
    for MSIZ-3
        dat     0,                  0
    rof
;==
        MSPACE
        MSPACE
;==
vbmb:   dat     >1,                 }2  ;Tired of tweaking this
ptr:    jmp     pit-PTR,            0
boot:   mov.i   ptr,                PTR
        mov.i   rip-1,              PTR-1

for 1
JCNT    EQU     (97)
;Restrict range of qbomb so as reduce likelyhood of early djn.
;Hopefully one-shot clears will start pot-body more often too.
JSTEP   EQU     (((CORESIZE/6) - MAXLENGTH) / JCNT)
J   for JCNT
        mov.i   vbmb,               <(JSTEP*J)+(MAXLENGTH-vamp)
    rof
        jmp     vamp
        sub.a   -1,                 -1
rof

    end boot

