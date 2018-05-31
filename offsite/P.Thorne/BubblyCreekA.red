;redcode-94
;name Bubbly Creek
;author Philip Thorne
;internal 26Dec02 1-Shot scanner 
;internal         Cocktail of Morbid Dread with S/D switch a la Ben Ford
;internal         Submitted Geist as ntest to 94nop made #20 - this was #1
;internal
;internal         Switched clear from A to B
;internal         now like ts6 i.e indirect in scanner [clr, and sptr trash]
;internal         and 2 ptr indirects in scan [also like ts6/4/3]
;internal 14Jun03 removed decoy. start scanning at sne. make more like tsnoD1
;internal         add 99 not 100. Use scan spl B field to enlarge decoy.
;strategy 15Jun03 1-Shot scanner
;strategy BC-A    [Toxic Spirit with added bubbles. Stero. Isomer of BC-B]
;kill Bubbly Creek
;assert CORESIZE==8000

START   EQU ((ptr-scan)-(STEP))
STEP    EQU (-2150) ;mod-50
GAP     EQU 25
OFF     EQU 1

;Basic clear is per Geist [nice S/D switch] with tweakings.
ptr:   dat.f   scan+STEP+OFF, scan+STEP+OFF+GAP+1 ;Scans and bombs off this

    for 5
        dat     0,              0
    rof

bptr:   dat     (eclr-ptr+3),   1
dptr:   spl     #(eclr-ptr+3),  ptr+450
        dat     0,              0
clr:    spl     #4000,          >ptr            ;A {} saftey. B helps gate
        mov     @bptr,          }ptr
        mov     @bptr,          }ptr
eclr:   djn.f   -2,             >dptr 

    for 12
        dat     0,              0
    rof

;find
scan:   add.f   incr,           @2
sptr:   sne.i   *ptr,           @ptr
        djn.f   scan,           <ptr
        spl     clr,            <jbmb+2
        mov.i   *-1,            >ptr
        mov.i   {jbmb+1,        >ptr
        sub.a  #99,             @-1

    for MAXLENGTH-CURLINE-7
        dat     0,              0
    rof

incr:   dat     #STEP,          #STEP+1
jbmb:   jmp     #0,             0
        dat     0,              0

    end scan+1

