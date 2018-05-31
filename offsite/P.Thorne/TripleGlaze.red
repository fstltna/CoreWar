;redcode-94m
;name Triple Glaze
;strategy 04Mar03 3D Clear [ish]
;author Philip Thorne
;kill Triple Glaze
;assert 1!=2

DEST1   EQU     (clr+(CORESIZE/3))
DEST2   EQU     (DEST1+(CORESIZE/2))

GATE    EQU     (clr-5)

clr:    spl     #0,     >(0-(CORESIZE/3))
        mov.i   bmb,    >GATE
        djn.f   -1,     >GATE
bmb:    dat     <1,     2-GATE

    for 70
        dat     0,      0
    rof

boot2:  dat     #clr,   #DEST2
start:  DAT     clr+1,  #DEST1  ;better without

boot:   spl     1,      #DEST1
        mov.i   }boot2, >boot
        mov.i   }boot2, >boot
        mov.i   {boot2, <boot2
        mov.i   {boot2, <boot2
        jmp     @boot2, }0

    for MAXLENGTH-CURLINE
        dat     0,      0
    rof

    end start+1

