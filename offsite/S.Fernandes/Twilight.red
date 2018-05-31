;redcode-tiny
;name Twilight
;author S.Fernandes
;strategy oneshot v1

;assert CORESIZE == 800

; entered the hill on 12 Mar 2006 in 24th place
; still on the hill on 31 Oct 2008, age 79, 10th place

        org    scan
step    equ    24
gap     equ    6
first   equ    loop+step*5

ptr     dat    first+gap-1     ,  first-1

        dat    0     ,  0

x       dat    1     ,  9
clr     spl    #350  ,  12
        mov    *x    ,  >ptr
        mov    *x    ,  >ptr
        djn.f  clr+1 ,  }clr

        for    2
        dat    0     ,  0
        rof

loop    add    inc   ,  ptr
scan    sne    *ptr  ,  @ptr
        djn.f  loop  ,  *ptr
        djn.f  clr   ,  ptr
inc     dat    step  ,  step
        end

