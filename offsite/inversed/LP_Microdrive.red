;redcode-lp
;author inversed
;name ...microdrive...
;strategy jmp bomber -> jd-clear
;strategy ultra-compact design
;assert (CORESIZE==8000) && (MAXPROCESSES==8)

;; Notes ...............................................................
; Warrior's body  consists  of just  4 executable  instructions.  Such a
; compact  design  is achieved  by transforming  the  stone  loop into a
; clear.  "tweak"  instruction  performs  the  transformation  and later
; switches the clear from jmp to dat.  The stone is booted with multiple
; processes, because few of them are lost when "tweak" is executed.
;
;; Constants ...........................................................
;; Stone
step    equ     (-187)
time    equ     3123
sofs    equ     hit-step*time
safe    equ     12

;; Boot
x0      equ     loop
bdist   equ     4750
dest    equ     x0+bdist
org     boot

;; Code ................................................................
loop    add     # step-1    ,   # sofs+1
hit     mov       bomb      ,   > loop
adj     djn       loop      ,   # time-6
tweak   jmp     } adj       ,   { 0

        dat       0         ,     0
        dat       0         ,     0
        dat       0         ,     0

bomb    jmp     # kill-loop ,     safe
kill    dat       kill-loop ,     safe

vec     dat         x0+4    ,     dest+0
        dat       dest+4    ,     dest+1
        dat         x0+9    ,     dest+2
        dat       dest+9    ,     dest+0
        dat       0         ,     dest+1
boot    spl       1         ,     dest+2
        spl       1         ,     dest+0
        mov     { vec+0     ,   { vec+1
        mov     { vec+2     ,   { vec+3
        mov       boot      ,     0
        jmp     @ vec       ,   } 0
;;......................................................................
