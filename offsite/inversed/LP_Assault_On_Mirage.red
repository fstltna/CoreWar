;redcode-lp
;author inversed
;name Assault on Mirage
;strategy jmp-throwing bomber + separate dat clear
;assert (CORESIZE==8000) && (MAXPROCESSES==8)

; Jmp-bomber (5 processes)  and a separate dat clear (1 process) running
; in parallel.  The  stone  is erased  just  a few cycles  after hitting
; itself. Independent components ensure greater reliability. Even if one
; component is destroyed, there is still a chance of a win or a tie.

org     boot

;...... B o m b e r ............................
hop     equ     831
step    equ     2 * hop
time    equ     3050
zofs    equ     hit - hop * time
sgate   equ     sptr + zclear + cptr - clear - 1

sptr    mov       bomb  ,   * zofs
        add     # step  ,     sptr
hit     mov       bomb  ,   @ sptr
        jmp       sptr  ,   < sgate
bomb    jmp     # hop   ,     0

;...... C l e a r ..............................
zclear  equ     7380
safe    equ     8
cptr    equ     clear - 3
gate    equ     cptr - 1

clear   mov       kill  ,   > cptr
        jmp      -1     ,   < gate
        dat       0     ,     0
kill    dat       0     ,     safe

;...... B o o t ................................
slen    equ     5
clen    equ     4

bds     equ     5500
bdc     equ     bds + zclear
x0      equ     bomb

cto     equ     x0 + bdc
sto     equ     x0 + bds

boot    spl       1          ,     0
        mov       boot       ,     0
        mov     < bpc        ,   { bpc
        mov       boot       ,     0
        mov     < bps1       ,   < bps2
        djn     > bps2       ,   # slen
bps1    spl     * bps2       ,     sptr + slen
bpc     spl       cto + clen ,     clear + clen
        mov     < bpc        ,   { bpc
bps2    div.f   # sto + 1    ,   # sto + slen
        mov.f   # 0          ,     bpc

