;redcode
;author   Philip Thorne
;name     FilchD
;
;strategy John Metcalf's Spring/Summer 2002 Tournament - Round 3
;strategy 
;strategy This is No Ties Allowed [Wayne Sheppard] with a different 
;strategy step and some strategy imp protection ideas [David Moore].
;strategy Only real differences are different step [makes no useful
;strategy difference] and that there are 3 processes in the loop.
;strategy [Not that I'm expecting papers or imps in Round 3 but...]
;strategy
;assert (CORESIZE==8000)

BOFF    equ 333
BOOT    equ (Stone-BOFF)
STEP    equ 3734          ;Original NTA was 2234 (no real diff)

        mov   -1,         0
Stone:  mov   <21,        1+STEP
        sub   1,          -1
        jmp   -2,         <-STEP

bust:   mov   <2663,      <2663     ;DM anti-crashing-imp idea
boot:   mov   Stone+2,    BOOT+2
        mov   Stone+1,    <boot
        mov   Stone,      <boot
        mov   Stone-1,    <boot
        mov   bust,       Stone+2-BOFF-STEP+4

start:  spl   1,          <-5555
        spl   1,          <-6666
        ;mov   -1,         0        ;7 procs work but are worse.
        jmp   @route,     <route

route:  dat   #0,         #loc

        ;jmp   Stone+2-BOFF, <-3333
        ;jmp   Stone+1-BOFF, <-3433
        ;jmp   Stone-BOFF,   <-3533
        jmp   Stone+2-BOFF, <-3333
        jmp   Stone+1-BOFF, <-3433
        jmp   Stone-BOFF,   <-3533
loc:    jmp   Stone-1-BOFF, <-3633

    end boot

