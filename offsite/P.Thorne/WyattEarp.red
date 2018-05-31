;redcode-94m
;name Wyatt Earp
;author Philip Thorne
;strategy Dodger->Clear
;internal Derived from CW38. The clear wastes time on scanned core.
;internal [scores 235 vs Toxic Spirit]
;assert 1
ptr     EQU     (scan-130)

scan:   jmz.f   scan,   <ptr
cloop:  mov.i   >bptr,  >ptr
        djn.b   cloop,  #6
        sub.ab  #3,     ptr
bptr:   jmp.b   @ptr,   #cptr

    for MAXLENGTH-CURLINE-5-1
        dat     0,      0
    rof

cptr:   dat.f   #0,     #150
bomb:   dat.f   #0,     #5+1+2
        dat     0,      0
        spl.b   #0,     >cptr+2667
dloop:  mov.i   bomb,   >cptr
dlt:    djn.f   dloop,  >cptr

    end scan

