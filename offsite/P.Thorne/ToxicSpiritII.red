;redcode-94nop verbose
;name Toxic Spirit II
;author Philip Thorne
;strategy 1-shot scanner. Faster [0.8c] version of Toxic Spirt
;
;internal Submitted to 94NOP as 'tetht' Nov 2006. Briefly KOTH, Feb2007.
;
;internal Reverses A|B of clear for imp safety. Fixes bug in stun so
;internal bombs are adjacent. spl/jmp stun. More indirection and core-
;internal colouring (e.g. jmp bomb throw). Removed decoy maker.
;internal
;bench Result for BC-D9 using [k50] over 15602 = 136.33        file=nA-bc-d9.red
;
;password recommended
;kill Toxic
;assert CORESIZE==8000

START   EQU ((ptr-scan)-(STEP))
STEP    EQU (-2150) ;mod-50
GAP     EQU 25
OFF     EQU 1

;Basic clear is per Geist [nice S/D switch] with tweakings.
;A and B columns inverted for protection vs simple imps.
ptr:   dat.f   scan+STEP+OFF+GAP+1, scan+STEP+OFF ;Scans and bombs off this

    for 5
        dat     0,              0
    rof

bptr:   dat     (eclr-ptr+3),    1               ;A incr for dec protection
dptr:   spl     #(eclr-ptr+3),   ptr+3450        ;B incr to shorten SPL cycle
        dat     0,              0
incr:
clr:    spl     #STEP,          }STEP
        mov     @bptr,          }ptr
        mov     @bptr,          }ptr
eclr:   djn.f   -2,             >dptr 

    for 12 + 25
        dat     0,              0
    rof

;find
scan:   add.f   jbmb,           @4
sptr:   sne.i   *ptr,           @ptr
        add.f   incr,           @2
        sne.i   *ptr,           @ptr
        djn.f   scan,           {ptr
        spl     clr,            {-1
stun:   mov.i   *-1,            >ptr
        mov.i   {jbmb+1,        >ptr
        sub.a   #98,             @-1

    for MAXLENGTH-CURLINE-7
        dat     0,              0
    rof

jbmb:   jmp     #STEP+1,        #STEP

    end scan+1

