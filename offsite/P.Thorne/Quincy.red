;redcode-94nop verbose
;name Quincy
;author Philip Thorne
;strategy 200211281004: 1-Shot (test | stop the tweaking release))
;                       This is q1a - much worse wilkies than q7
;kill Quincy
;bench oct=137#8000 w=176#400 [Why so low - was 188?] 28Nov02
;assert CORESIZE==8000

START   EQU ((ptr-scan)-(STEP+ADJ))
STEP    EQU (-2975)
ADJ     EQU (-1)

;punctured quiz-based clear
zptr:   dat.f   clr,            (ptr-zptr)-MAXLENGTH
        dat     0,              0
        dat.f   <-15,           20
clr:    spl     #-2670,         30
        mov.i   @2,             >zptr
        mov.i   @1,             >zptr
        djn.b   -2,             {clr

    for 3
        dat     0,              0
    rof

;find
scan:   add.ab      #STEP+ADJ,  ptr
        jmz.f       scan,       >ptr
        mov.i       clr,        <ptr
        add.b       ptr,        zptr
ptr:    jmp         clr,        }scan+STEP+1

    for MAXLENGTH-CURLINE-4
        dat         0,0
    rof

;Decoy lifted from HeScansAlone
tDecoy    equ    ptr+STEP+STEP+4
tStart    mov    <tDecoy+0,{tDecoy+2     ; make a quick-decoy
          mov    <tDecoy+3,{tDecoy+5     ; to foil one-shots
          mov    <tDecoy+6,{tDecoy+8     ; and the occasional q-scan
          djn.f  scan  ,<tDecoy+10

    end tStart
    end scan

