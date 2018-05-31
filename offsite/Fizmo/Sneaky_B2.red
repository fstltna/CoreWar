;redcode-94
;author Christian Schmidt
;name Sneaky B2
;strategy Self-Replicating Stone/scanner
;assert 1

;------------ Qscan Constant ---------------

zero    equ     qbomb
qtab3   equ     qbomb
qz      equ     2108
qy      equ     243

qc2 equ ((1 + (qtab3-qptr)*qy) % CORESIZE)
qb1 equ ((1 + (qtab2-1-qptr)*qy) % CORESIZE)
qb2 equ ((1 + (qtab2-qptr)*qy) % CORESIZE)
qb3 equ ((1 + (qtab2+1-qptr)*qy) % CORESIZE)
qa1 equ ((1 + (qtab1-1-qptr)*qy) % CORESIZE)
qa2 equ ((1 + (qtab1-qptr)*qy) % CORESIZE)

qoff    equ    -88
qstep   equ    -7
qtime   equ    20

;-------Constants for optimization----------

sLen   equ 21
sOff1  equ 219
sOff2  equ 7771
sStep1 equ 3431
sStep2 equ 3916
sAwa   equ 2543

pAwa   equ 5895

;-------------------------------------------

        dat     0,              0
qbomb   dat     >qoff,          >qc2

;------ 45 instructions --------------------

pGo     spl     1               , 0

    for 5
        mov.i   <sTab+1,       {pBoot
    rof
pBoot   djn     zero+pAwa,   #1


        dat     0,              0
        dat     0,              0
        dat     0,              0

sStart  mov     #sLen,   #sLen
sGo     add.f   sTab,    sScan
sScan   mov.i   }sOff1,  sOff2
        jmz.f   -2,      {sScan
        mov.i   sTab,    }sScan
        mov     <sStart, {to
        jmn     -2,      sStart
        spl     >sStart, }-200
to      jmz     sAwa,    *0
sTab    dat     <sStep1, >sStep2


for     25
        dat     0,              0
rof

;-------------------------------------------

        dat     0,              <qb1
qtab2   dat     0,              <qb2
        dat     0,              <qb3


        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0

        dat     zero-1,         qa1
qtab1   dat     zero-1,         qa2

        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0


qgo sne qptr+qz*qc2, qptr+qz*qc2+qb2
    seq <qtab3,      qptr+qz*(qc2-1)+qb2
    jmp q0,          }q0
    sne qptr+qz*qa2, qptr + qz*qa2 + qb2
    seq <qtab1,      qptr+qz*(qa2-1)+qb2
    jmp q0,          {q0
    sne qptr+qz*qa1, qptr+qz*qa1+qb2
    seq <(qtab1-1),  qptr+qz*(qa1-1)+qb2
    djn.a q0,        {q0
    sne qptr+qz*qb3, qptr+qz*qb3+qb3
    seq <(qtab2+1),  qptr+qz*(qb3-1)+(qb3-1)
    jmp q0,          }q1
    sne qptr+qz*qb1, qptr+qz*qb1+qb1
    seq <(qtab2-1),  qptr+qz*(qb1-1)+(qb1-1)
    jmp q0,          {q1
    sne qptr+qz*qb2, qptr+qz*qb2+qb2
    seq <qtab2,      qptr+qz*(qb2-1)+(qb2-1)
    jmp q0,          }4443              ;extra attack
    seq >qptr,       qptr+qz+(qb2-1)
    jmp q2,          <qptr
seq qptr+(qz+1)*(qc2-1),qptr+(qz+1)*(qc2-1)+(qb2-1)
    jmp q0,          }q0
seq qptr+(qz+1)*(qa2-1),qptr+(qz+1)*(qa2-1)+(qb2-1)
    jmp q0,          {q0
seq qptr+(qz+1)*(qa1-1),qptr+(qz+1)*(qa1-1)+(qb2-1)
    djn.a q0,        {q0
    jmz.f pGo,     qptr+(qz+1)*(qb2-1)+(qb2-1)

q0      mul.b   *2,             qptr
q2      sne     {qtab1,         @qptr
q1      add.b   qtab2,          qptr
        mov     qtab3,          @qptr
qptr    mov     qbomb,          }qz
        sub     #qstep,         qptr
        djn     -3,             #qtime
        jmp     pGo,          }3256   ;extra attack

        dat     0,              0
        dat     0,              0
        dat     0,              0
        dat     0,              0

end qgo

