;redcode
;name Zeppelin B 11
;strategy bomb stuff
;author Steve Gunnell
;assert 1

Decoy   equ 3887
DIST    equ 5502
STEP    equ 13126

imp     mov     0,      2449
s0      spl     0,      < Decoy
s1      mov     < s2-4748, s0-1138
s2      sub     1,      -1
s3      djn     -2,     < -STEP
boot    mov     s3,     DIST
        mov     s2,     < boot
        mov     s1,     < boot
        mov     s0,     < boot
        spl     @ boot, < Decoy
        sub     boot,   boot
        spl     1,      < Decoy
        for 6
        spl     1,      < Decoy
        rof
        spl     2,      < Decoy
        jmp     @0,    imp
        add     #2449, -1

        end boot

