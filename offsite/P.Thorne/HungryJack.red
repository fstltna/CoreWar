;redcode-94nop verbose
;name Hungry Jack
;author Philip Thorne
;strategy 20040914 One Shot descended from Toxic Spirit.
;url http://corewar.home.pipeline.com
;kill tetht
;kill Hungry Jack
;assert CORESIZE==8000

;internal BC-D5.red. The BC-D[89]* do better vs benchmark but not on hill.
;internal Some changes from Toxic Spirit:
;internal Indirect ptr refs from scan. Removed decoy. Start from scan line.
;internal Skip back 98. Fixed bug in blocker. 2nd jump to B loc. Imp safety.

START   EQU ((ptr-scan)-(STEP))
STEP    EQU (-2150) ;mod-50
GAP     EQU 25
OFF     EQU 1

;Basic clear is reverse Geist [nice S/D switch] with tweakings.
ptr:   dat.f   scan+STEP+OFF+1, scan+STEP+OFF+GAP ;Scans and bombs off this

    for 5
        dat     0,              0
    rof

bptr:   dat     (eclr-ptr+3),   1               ;A incr for dec protection
dptr:   spl     #(eclr-ptr+3),  ptr+450         ;B incr to shorten SPL cycle
        dat     0,              0
incr:
clr:    spl     #STEP+1,        }STEP
        mov     @bptr,          }ptr
        mov     @bptr,          }ptr
eclr:   djn.f   -2,             >dptr

    for 37
        dat     0,              0
    rof

;find
scan:   add.f   incr,           @2
sptr:   sne.i   *ptr,           @ptr
        djn.f   scan,           {ptr
        spl     clr,            {-1
        mov.i   *-1,            >ptr
        mov.i   {jbmb+1,        >ptr
        mov.i   *jbmb+1,        }ptr
        sub.a   #98,            @-1

    for MAXLENGTH-CURLINE-6
        dat     0,              0
    rof

jbmb:   jmp     #0,             0

    for MAXLENGTH-CURLINE
        dat     0,              0
    rof

    end scan+1

