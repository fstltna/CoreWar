;redcode
;name Earp Jnr
;author Philip Thorne
;startegy 31Jan03 Redcoder Frenzy Tournament Round 6 [No SPL allowed]
;strategy         Entry #1 Dodger
;
;assert (MAXLENGTH==8) && (MINDISTANCE==8) && (CORESIZE==8000) 

ptr     EQU     (scan-1300)

scan:   jmz.f   scan,   <ptr
cloop:  mov.i   >bptr,  >ptr
        djn.b   cloop,  #3
bptr:   jmp.b   <ptr,   #bmb

        dat.f   0,      0

bmb:    dat.f   0,      0
        mov.i   bmb,    >1      ;suicidal [bad, overwrites scanned area]
        jmp     -1,     }10

    end scan

