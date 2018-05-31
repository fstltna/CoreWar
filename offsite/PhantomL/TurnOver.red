;redcode-nano
;name TurnOver
;author PhantomL
;strategy optimized
;assert CORESIZE==80
spl.x  #40 ,{-1
spl    #67 ,<72
mov    $-3 ,<71
mov.i  #8 ,}1
djn.x  $12 ,{46
end

