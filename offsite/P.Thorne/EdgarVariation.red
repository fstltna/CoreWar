;redcode-94nop verbose
;name Edgar Variation
;author Waknuk
;url http://www.ociw.edu/~birk/COREWAR/94/HILL/silvertalon12.red
;strategy Edgar's Silver Talon (Scanner) with minor changes.
;internal - Changed boot over-wipe to do some trashing
;internal - Clear closer to body so paper stays stunned longer
;internal - reverse step. Reduced scan length by 50. STY.red
;internal - ST scores 138.16, this 138.88 vs 'ALL' benchmark

;assert 1

      org boot

;the decoy

for 9
      spl #1,#1
      spl #1,@1
      spl #1,}1
      spl #1,{1
      spl #-4,#1      ;transparence!
      spl #1,<1
      spl #1,*1
      spl #1,>1
rof

;the actual warrior. Execution starts at loop

head    spl #-4,5000+(152*10)   ;not to be executed, except when hit by DJN
                              ;       in which case I'm dead anyways
loop    mov head,>head          ;place carpet
      add.f step,scan         ;move scan window
scan    cmp.i }4,0              ;found something?
      mov.b scan,@loop        ;       Yes. adjust carpet pointer.
      djn loop,#999-50        ;fall through to d-clear after 1000-50 scans
step    spl #152,>152         ;standard d-clear PBT -ve
      mov clr,>head-5
      djn.f -1,>head-5
clr     dat 1,#18               ;d-clear bomb


;boot pointers
bp      dat -2000+5,-2000-9+5
wp      dat 0,clr+1

boot    mov <wp,{bp             ;the boot, neat and fast.
for 9
      mov <wp,{bp
rof
;        spl @bp                 ;split to target
;        mov 0,bp                ;erase destination pointer
                              ;and die
  spl @bp, <1000
  mov.i <1000, bp

end

