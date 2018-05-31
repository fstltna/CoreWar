;redcode-tiny
;name Table Scan II
;author John Metcalf
;strategy table scan with BiShot style clear
;assert CORESIZE==800

ptr: sne   *tab-1,   @tab-1
     djn.f <0,       >0
     mov.f @ptr,     }0

     spl   #0,       0
clr: mov   sb,       >ptr
     mov   sb,       }ptr
     djn.a clr,      {-430

     dat   410,      10
sb:  spl   #430,     30

     first equ ptr+308
   a for   11
     spl   #first-a*21+400,<first-a*21
     rof
tab  end

