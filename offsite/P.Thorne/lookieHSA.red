;redcode-94nop verbose
;name lookieHSA
;author pbt
;notest
;strategy Ping hill for HSA-alikes
;kill
;assert CORESIZE == 8000

;This is Ian Sutton's Carbonite plus decoy to create HSA blind-spot.

        org     strat2
for 90
 nop #1, #1
rof
 dat 0, 0
 dat 0, 0
 dat 0, 0
;yep, this is All Carbonite
dbomb   dat     >-1, >1
strat2  spl     #0, <-100
        mov     dbomb, tar-197*3500
tar     add     #197, -1        ; gets bombed to start coreclear
        djn.f   -2, <-1151

