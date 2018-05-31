;redcode-94 verbose
;name Bubbly Creek D
;author Philip Thorne
;Ztrategy 26Dec02 1-Shot scanner 
;Ztrategy         Cocktail of Morbid Dread with S/D switch a la Ben Ford
;internal         Submitted Geist as ntest to 94nop made #20 - this was #1
;internal
;internal         spl/jmp bomb. indirect jmp bmb throw as decoy.
;internal         indirect 2 ptr refs from scan
;internal         tiedied-up code. Still B driven.
;internal         ts4 with more indirect in scanner [clr, and sptr trash]
;internal         removed decoy. start scanning at sne. Skip back 99
;internal         Use B of spl clr to increase decoy
;Ztrategy 15Jun03 1-Shot scanner
;Ztrategy BC-B    [Toxic Spirit with added bubbles. Stero. Isomer of BC-A]
;Zstrategy BC-B    [Stero. Isomer of BC-A] test
;
;internal 26Aug04  Moved decoy 1000 forward and switch { for < for variety
;internal          Fix bug so forward halt adjacent.
;internal          Skip back 98 instead of 99
;
;kill Bubbly Creek
;assert CORESIZE==8000

START   EQU ((ptr-scan)-(STEP))
STEP    EQU (-2150) ;mod-50
GAP     EQU 25
OFF     EQU 1

;Basic clear is per Geist [nice S/D switch] with tweakings.
ptr:   dat.f   scan+STEP+OFF+GAP, scan+STEP+OFF+1 ;Scans and bombs off this

    for 5
        dat     0,              0
    rof

bptr:   dat     1,              (eclr-ptr+3)    ;B incr for dec protection
dptr:   spl     #ptr+450,       (eclr-ptr+3)    ;A incr to shorten SPL cycle
        dat     0,              0
clr:    spl     #4000,          }ptr            ;A {} saftey. B helps gate
        mov     *bptr,          >ptr
        mov     *bptr,          >ptr
eclr:   djn.f   -2,             }dptr 

    for 12
        dat     0,              0
    rof

;find
scan:   add.f   incr,           @2
sptr:   sne.i   *ptr,           @ptr
        djn.f   scan,           <ptr
        spl     clr,            <jbmb+2
        mov.i   *-1,            *ptr	;26Aug was }ptr
        mov.i   {jbmb+1,        }ptr
        sub.ab  #98,           @-1	;26Aug was 99

    for MAXLENGTH-CURLINE-7
        dat     0,              0
    rof

incr:   dat     #STEP,          #STEP+1
jbmb:   jmp     #0,             0
        dat     0,              0

for 1
;decoy out of HSA
tDecoy: EQU    (ptr-(STEP)+3+1000)     ;for -2150  [Intended to hit but is better not]

tStart: mov    {tDecoy+0,       <tDecoy+2     ; make a quick-decoy
        mov    {tDecoy+3,       <tDecoy+5     ; to foil one-shots
        mov    {tDecoy+6,       <tDecoy+8     ; and the occasional q-scan
        djn.f  scan+1,          {tDecoy+10

rof

    end tStart
    end scan+1

