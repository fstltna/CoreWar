;redcode-tiny
;name Synergy
;author inversed
;strategy Jmp-bomber with SPL stripe
;strategy Defend while attacking, attack while defending
;assert CORESIZE==800

; Jmp *hop acts similarly to the TNT mov hop, 1 bomb. Single-process warriors
; are  killed, multi-process  ones are  crippled. Spl stripe in the main loop
; provides anti-paper  defence. Beside the immediate stun  effect, there is a
; chance that the  processes  trapped  by the jmp bombs end up in the carpet.
; D-clear  starts right in front of the spl stripe to maximize the stun time.
; Also note the hybrid qBombing / decoy-maker.

hop     equ     585
step    equ     2*hop
zofs    equ     (hit-step*time)
time    equ     79
stripe  equ     599
x0      equ     bomb

safe    equ     7
any     equ     400
cptr    equ     ptr+1

qlen    equ     9
qsb     equ     521
qa      equ     621
qb      equ     535

org     qbomb

bomb    jmp     * hop    ,   < 1
loop    add     # step   ,     ptr
       mov       bomb   ,   @ ptr
ptr     mov       bomb   ,   * zofs
       mov       cs0    ,   < x0+stripe
hit     djn       loop   ,   # time
cs0     spl     # 0      ,     0
dc      mov       kill   ,   > cptr
       djn.f     dc     ,   > cptr
kill    dat       any    ,     safe

   for 9-qlen
       dat       0      ,     0
   rof

qbomb  
i   for qlen
       mov     { x0+i+qa,     x0+i*qsb+qb
   rof
       djn.f     loop+1 ,   { x0+qlen+2+qa

