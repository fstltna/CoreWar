;redcode-88
;name LateEight
;author P Thorne
;strategy Stone+Scan,AntiVamp,Clear,Gate
;
;Entry 2/2 for John Metcalfs Valentine Tournament 2015
;Players may enter one or two programs with a maximum combined length of 50 instructions. 
;Programs face each other in a one-on-one round robin with no self-fights. 
;Entries must be your own work. CWS'88 Redcode applies with extended cycles as follows:
; pmars -8 -s 8000 -p 8000 -c 1000000 -l 50 -d 100
;
;assert (CORESIZE==8000) && (MAXPROCESSES==8000) && (MINDISTANCE==100)
;assert (MAXLENGTH==50) 
;assert (MAXCYCLES==1000000)
;
;internal DM#400 = 105.71 +3 (weak, but ok vs Tangel Trap)

STEP    EQU (5032)          ;mod-8
CPTR    EQU (mptr+5)
SOFF    EQU (loop-500)

CNEXT   EQU (DSTART-4)
DSTART  EQU (clear-3)

ISIZE   EQU (1143)
GATE2   EQU ((clear-place)+CNEXT-CPTR)

bmb2    EQU (loop+50)

sptr:   MOV     bmb2,       SOFF
loop:   ADD     #STEP,      1           ;hit
        MOV     bmb1,       STEP-1
scan:   JMZ     loop,       <sptr
prime1: SUB     @sptr,      CPTR
        DJN     2,          CPTR
        JMP     sptr
prime2: ADD     sptr,       @-2
        JMP     clear
bmb1:   JMP     <(prime2-loop+1)        ;hit

        DAT     <GATE2,     <-6
dbmb:   DAT     <ISIZE,     <CNEXT-CPTR
sbmb:
clear:  SPL     0,          <CNEXT-CPTR
place:  MOV     @mptr,      <CPTR
        DJN     -1,         <DSTART
mptr:   DAT     #0,         #sbmb
;       DAT     $0,         $0
;       DAT     $0,         $0          ;hit
;       DAT     $0,         $0
;       DAT     $0,         $0
;cptr:  DAT     $0,         $0          ;B needs to point outside body

    END loop+1

