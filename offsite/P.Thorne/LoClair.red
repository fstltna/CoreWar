;redcode
;name LoClair
;author Philip Thorne
;strategy Limited process clear. [Did you guess?]. Was intended to be
;strategy a component in something a little more interesting but spent
;strategy too long trying to get my vamp to kill paper - without much
;strategy success, hopefully this will do better. Doesn't look like it.
;strategy John Metcalf 2002 Tournament Round 2, Warrior 2
;assert (CORESIZE==55440) 
;assert (MAXPROCESSES==8)
;assert (MAXLENGTH==200) && (MINDISTANCE==200)

tloclr EQU     (zptr)

zptr:   spl     #lbmb3,         <(eloclr-tloclr) + CORESIZE/3 + 1
loclr:  mov.i   *zptr,          >zptr
        djn.f   -1,             >zptr
        jmp     -2,             >zptr   ;Unf. but can't loose procs.
        dat     0,              0
lbmb:   dat     <lbmb -zptr,    <(eloclr-tloclr) + 7
lbmb2:  jmp     #lbmb -zptr,    <(eloclr-tloclr) + 7
lbmb3:  jmp     #lbmb2-zptr,    <(eloclr-tloclr) + 7

eloclr EQU     lbmb3

    for 150
        dat     0,              0
    rof

start:  spl     1
        spl     1
        spl     1
        jmp     loclr

    end start

