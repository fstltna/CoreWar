;redcode-88
;name OnceIn88
;author P Thorne
;strategy OneShot,Clear,Gate
;
;Entry 1/2 for John Metcalfs Valentine Tournament 2015
;Players may enter one or two programs with a maximum combined length of 50 instructions. 
;Programs face each other in a one-on-one round robin with no self-fights. 
;Entries must be your own work. CWS'88 Redcode applies with extended cycles as follows:
; pmars -8 -s 8000 -p 8000 -c 1000000 -l 50 -d 100
;
;assert (CORESIZE==8000) && (MAXPROCESSES==8000) && (MINDISTANCE==100)
;assert (MAXLENGTH==50) 
;assert (MAXCYCLES==1000000)
;
;internal DM#400 = 135.10 +8 (Troubled by vamps)

CNEXT   EQU (DSTART+4)
DSTART  EQU (3)
DOFFSET EQU (2000)
ISIZE   EQU (2667)
GATE2   EQU (clear-place+(clear-CNEXT-cptr))

STEP    EQU (2950)
GAP     EQU (25)
MSIZ    EQU (50)

jbmb    EQU (clear)

;The slower version of this clear in LateEight is presented betetr

        DAT     #0,         #DOFFSET    ;not nec.
        DAT     <GATE2,     <-3
dbmb:   DAT     <ISIZE,     <(clear-CNEXT-cptr+2)
sbmb:
clear:  SPL     0,          <clear-CNEXT-cptr
place:  MOV     @bptr,      <cptr
        MOV     @bptr,      <cptr
        DJN     -2,         <clear-DSTART

incr:   DAT     #STEP,      #STEP 
        DAT     #0,         #0

bptr:   DAT     #0,         #sbmb


scan:   ADD     incr,       1
cptr:
look:   CMP     STEP+GAP+2, STEP+2
        SPL     clear,      <1
        JMZ     scan,       0
        MOV     jbmb,       @cptr
        ADD     #GAP+2,     @-1
        ADD     #MSIZ,      @-2

    END scan+1

