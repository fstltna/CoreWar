
de-tiny
;name Flux
;author John Metcalf
;strategy decoy maker -> .5c oneshot scan -> spl/div clear
;assert CORESIZE==800

        step equ 12
        first equ dptr+step*16
        dec equ 30

        s equ -12
        d equ loop+214

loop    add.ba #first,     #step
        jmz.f  loop,       *loop
bptr    div.ba #9,         #1
dptr    spl    #8,         dec
clear   mov    @bptr,      }loop
        djn.f  clear,      >dptr

        for    6
        dat    0,0
        rof

make  z for    6
        mov    <d+s*z,     {d+s*z+s-1
        rof
        djn.f  loop+1,     <d+s*8

        end    make

