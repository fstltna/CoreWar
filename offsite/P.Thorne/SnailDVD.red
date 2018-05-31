;redcode-94nop verbose
;name Snail-DVD
;author Philip Thorne
;strategy bi-bomber, parallel clears, one retard (snail) the other
;strategy is derived from a David Van Dam clear via (?) Bjoern
;strategy Guenzel on rgc. It replaces my zclearL (until ...?)
;
;kill
;mybench 8000 mp=115 (400), 8000 w=146(600), 55440 lk=120(100)

for CORESIZE==8000
;assert (CORESIZE==8000)
;assert (MAXLENGTH==100) && (MINDISTANCE==100)
;assert (MAXCYCLES==80000)
;assert (MAXPROCESSES>=8)
STEP    EQU     (-3288)              ;1504:32 1424:16 1490:10 1432:8
ANTIMP  EQU     1143
rof

for CORESIZE==55440
;assert (CORESIZE==55440) 
;assert (MAXPROCESSES>=8)
;assert (MAXCYCLES==500000)
;assert (MAXLENGTH==200) && (MINDISTANCE==200)
STEP    EQU     (-22952)            ;12104, 24184, 21256, 20344 & 22952
ANTIMP  EQU     34117               ;35873
rof

MSIZ    EQU     (8)
PTR     EQU     (fang+STEP)
MSPACE  EQU     for MSIZ
        EQU         dat 0,  0
        EQU     rof

sptr    EQU     vdptr     ;Use Van Dam's
inc     EQU     pit

;assert (STEP % MSIZ) == 0

fang:   spl     *STEP-(fang-PTR)+(STEP*(CORESIZE/MSIZ)/2),   -STEP-(STEP*(CORESIZE/MSIZ)/2)
vamp:   mov.i   fang,               >fang
        mov.i   vbmb,               }fang
        add.f   inc,                fang
        jmz     vamp,               PTR
        spl     sclr
cptr:   nop     dclr,             (fang+MAXLENGTH+1) + (CORESIZE/4)
    for MSIZ-(cptr-fang+1)
        dat     0,                  0
    rof
;===
        MSPACE

        dat     0,                  0
        dat     0,                  0
    for MSIZ-2
        dat     0,                  0
    rof

        MSPACE
;===
; This was posted to rgc by someone for Bjoern Guenzel who recomended it
; as a good type of clear origniating from David Van Dam. Similar but less
; involved than the latter's TheCoreClear. Slight changes for Large hill.
;
; More to the point better than my own zclearL (esp vs stones & imps).

for 1                                   ;### Van Dam - start
sclr    EQU     first
gate    EQU     -800
OFF     EQU     (last-vdptr+2)

        dat     0,                  0
vdptr:  dat     -5,                 ((dclr+2)-last) +2 + (MAXLENGTH)
        dat     0,                  0
        dat     0,                  0
first:  spl     #0,                 >gate
        mov.i   *bptr,              >vdptr
        djn.f   -1,                 {vdptr
        dat     0,                  0
;===
        dat     0,                  0   ;maybe put another 5 here as is
                                        ;needs djn to hit next (dangerous)
bptr:   dat     1,                  last-vdptr+2
for CORESIZE==8000
last:   spl     #-10-44+11+2,       last-vdptr+2
rof
for CORESIZE==55440
last:   spl     #-OFF-98,           OFF
rof
        dat     0,                  0
        dat     0,                  0
        dat     0,                  0
        dat     0,                  0
        dat     0,                  0
rof                                     ;### Van Dam - end
;===

        dat     0,                  0
dptr:   dat     0,                  >((dclr-dptr+3)+ (MAXLENGTH-dclr))
dbmb:   dat     <ANTIMP,            >((dclr-sptr)+3)
        dat     0,                  0
        dat     0,                  0
dclr:   mov.i   dbmb,               >dptr
        djn     dclr,               >sptr
        dat     0,                  0

        MSPACE

        dat     0,                  0
        dat     0,                  0
pit:    spl     #STEP-1,            #-STEP-1
        spl     pit2,               >PTR
    for MSIZ-2-1-2-2
        spl     #0,                 #0
    rof
rip:    spl     -1,                 {(CORESIZE/4)
        spl     -1,                 >-1
        dat     0,                  0       ;Gets bombed

        MSPACE

        dat     0,                  0
pit2:
m   for MSIZ-2-1-1
        spl     #0,                 #0
    rof
        spl     -1,                 >rip
        jmp     pit2

        ;MSPACE
    for MSIZ-1-1
        dat     0,                  0
    rof

vbmb:   dat     >1,                 }2
ptr:    spl     pit-PTR,            0
boot:   mov.i   ptr,                PTR
        mov.i   pit2,               PTR-1

for 1
for CORESIZE==8000
JCNT    EQU     (2)
rof
for CORESIZE==55440
JCNT    EQU     (101)
rof
JSTEP   EQU     ((CORESIZE - MAXLENGTH) / JCNT)
J   for JCNT
        mov.i   vbmb,               <(JSTEP*J)+(MAXLENGTH-vamp)
    rof
        jmp     vamp
rof

    end boot


