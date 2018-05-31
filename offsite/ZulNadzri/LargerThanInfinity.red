;redcode-tiny quiet
;name Larger Than Infinity
;author Zul Nadzri
;strategy August 2005
;ver 1 based on white noise but minimise the length
;assert 1

        ORG     start

step    equ     -67

top     add     incr    , @ptr
start   sne     }step   , step-6
        djn.f   top     , {50
incr    spl     #-26    , {-26
ptr     mov     @loop   , >start
        mov     @loop   , >start+1
        mov     @loop   , >start+1
loop    djn.x   -2      , {stun
        dat     #-181   , }8
stun    spl     #-25    , 12
        spl.x   #1      , 1

        for     MAXLENGTH-CURLINE
        dat     0,0
        rof
        end

