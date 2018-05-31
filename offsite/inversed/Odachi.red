;redcode-lp
;author inversed
;name Odachi
;strategy 0.75 scan / bomb -> jd-clear
;assert (CORESIZE == 8000) && (MAXPROCESSES == 8)

; When something is found by the scan, adjust the pointer so it would get jmp-
; bombed in the next two iterations. Switch to clear when self-hit is detected.

hop     equ 45
step    equ 3 * hop
zofs    equ hit + step

safe    equ 7
gate    equ ptr - 1

org     hit

ptr     seq     > zofs       ,     zofs + hop
adj     sub       bomb       ,     ptr
        add       inc        ,     ptr
hit     mov       bomb       ,   * ptr
        jmn.a     ptr        ,   @ hit
inc     spl     # step       ,     step
cloop   mov     * adj        ,   > hit
        jmp       cloop      ,   < gate

for     2 * hop - 7
        dat       0          ,     0
rof

kill    dat       kill - adj ,     safe
bomb    jmp     # 2 * hop    ,     2 * hop

