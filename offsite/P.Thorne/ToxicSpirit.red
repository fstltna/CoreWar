;redcode-94nop
;name Toxic Spirit
;author Philip Thorne
;strategy 26Dec02 1-Shot scanner 
;strategy         Cocktail of Morbid Dread with S/D switch a la Ben Ford
;kill ntest
;ZZZkill Toxic Spirit
;internal         Submitted Geist as ntest to 94nop made #20 - this was #1
;assert CORESIZE==8000

START   EQU ((ptr-scan)-(STEP))
STEP    EQU (-2150) ;mod-50
GAP     EQU 25
OFF     EQU 1

;Basic clear is per Geist [nice S/D switch] with tweakings.
gate:
ptr:   dat.f   scan+STEP+OFF+GAP, scan+STEP+OFF ;Scans and bombs off this

    for 5
        dat     0,              0
    rof

bptr:   dat     1,              15      ;B increased for dec protection
dptr:   spl     #gate+450,      15      ;A increased to shorten SPL cycle.
        dat     0,              0
clr:    spl     #-25,           }ptr    ;A historic. B gates gate
        mov     *bptr,          >ptr
        mov     *bptr,          >ptr
        djn.f   -2,             }dptr

    for 12
        dat     0,              0
    rof

;find
scan:   add.f   incr,           ptr
        sne.i   *ptr,           @ptr
        djn.f   scan,           <ptr
        spl     clr,            {0
        mov.i   jbmb,           }ptr
        mov.i   jbmb,           }ptr
        sub.ab  #100,           ptr

    for MAXLENGTH-CURLINE-7
        dat     0,              0
    rof

incr:   dat     #STEP,          #STEP+1
jbmb:   jmp     #0,             0
        dat     0,              0

for 1
;decoy out of HSA
tDecoy: EQU    (ptr+2162-9)     ;for -2150  [Intended to hit but is better not]

tStart: mov    <tDecoy+0,       {tDecoy+2     ; make a quick-decoy
        mov    <tDecoy+3,       {tDecoy+5     ; to foil one-shots
        mov    <tDecoy+6,       {tDecoy+8     ; and the occasional q-scan
        djn.f  scan,            <tDecoy+10
rof

    end tStart
    end scan

