;redcode-94
;name bunker t3
;kill bunker
;author P.Kline
;strategy self-repair pair
space    equ 4000
step     equ 13

copyf    dat    #fin
copyt    dat    #fin+space

start    mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         mov <copyf,<copyt
         jmp pre
     for 20
         dat   0,0
     rof
pre      add   #step+step,bomb
         mov   b1,@bomb
bomb     mov   b2,}202
         djn   pre,#290
         jmp   splits
b1       jmp   13,2667
b2       jmp   12,2667

     for 20
         dat 0,0
     rof
         
splits   spl 1
         mov -1,0
         spl 1
         mov -1,0
         spl chk
         jmp chk+space

     for 20
         dat 0,0
     rof

rset     sub.a  #0,#space
chk      sub.ba }fix,rset
         jmn.a  kill,rset
clr      mov    d3,>-20
loop     jmp    chk,{fix

kill     mov    d4,{fix
         spl    rset,1000
fix      mov    <rset+space,{rset+space
offset   jmp    rset+space,#2964
d3       dat    <2667,#50
d4       dat    #fin-rset,#fin-rset+space

fin      dat 0,0

         end    start
