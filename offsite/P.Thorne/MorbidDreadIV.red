;redcode-94x verbose
;name Morbid Dread IV
;author Philip Thorne
;strategy   1-Shot scanner with decoy
;strategy   Submitted 01Dec02 1500
;kill Morbid Dread
;assert 1

START   EQU ((ptr-scan)-(STEP))
STEP    EQU (-2150) ;50
GAP     EQU 25
OFF     EQU 0

;quiz-based
zptr:   dat.f   clr,            (ptr-zptr)-MAXLENGTH
        dat     0,              0           ;weakend
        dat.f   <-15,           20
clr:    spl     #-2670,         30
        mov.i   @2,             >zptr
        mov.i   @1,             >zptr
        djn.b   -2,             {clr

    for 4
        dat     0,0
    rof

;find
scan:   add.f   incr,           ptr
ptr:    sne.i   scan+STEP+OFF,  scan+STEP+OFF+GAP
        djn.f   scan,           <ptr
        add.b   ptr,            zptr
        mov.i   clr,            *ptr
        mov.i   clr,            @ptr
        jmp     *0,             {0

    for MAXLENGTH-CURLINE-6
        dat         0,0
    rof

incr:   dat     #STEP,          #STEP+1
        dat     0,              0

;decoy out of HSA
tDecoy: EQU    (zptr+1641)
tStart: mov    <tDecoy+0,       {tDecoy+2     ; make a quick-decoy
        mov    <tDecoy+3,       {tDecoy+5     ; to foil one-shots
        mov    <tDecoy+6,       {tDecoy+8     ; and the occasional q-scan
tEnd:   djn.f  scan,            <tDecoy+10

    end tStart

