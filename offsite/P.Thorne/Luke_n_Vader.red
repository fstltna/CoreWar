;redcode-lp
;name Luke N'Vader
;author Philip Thorne
;strategy One Shot Scanner
;internal Based on Lucky Luke. Switched SPl # in clear for jmp -1
;internal Using add.ad with mod-25 step.
;kill Luke N'Vader
;assert (CORESIZE==8000) && (MAXPROCESSES==8) && (MAXLENGTH==200)

ptr     EQU (sptr-MAXLENGTH+2)

;clean
bptr:   dat     1,              2+7+(bptr-ptr)
dptr:   spl     #ptr+150,       2+7+(bptr-ptr)

        dat     0,              0
clr:    mov     *bptr,          >ptr
        mov     *bptr,          >ptr

        djn.f   -2,             }dptr
        jmp     -1,             }ptr

    for 73-CURLINE
        dat     0,              0
    rof

jbmb:   jmp     #0,             0

    for MAXLENGTH-CURLINE-14 -2
        dat     0,              0
    rof

;find
STEP    EQU     2975    ;mod 25
OFF     EQU     72

scan:   add.ab  #STEP,          sptr
        jmz.f   scan,           @sptr
sptr:   spl     clr,            OFF+STEP
        mov.b   sptr,           ptr
        mov.i   {jbmb+1,        @sptr

    for 8
        dat     0,              0
    rof

start:  jmp     scan+1,         {sptr+OFF

    end start

