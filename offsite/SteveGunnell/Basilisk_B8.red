;redcode
;name Basilisk B 8
;strategy Medusa variant
;author Steve Gunnell
;assert 1

CDIST   equ 10
IVAL    equ (118*2)
OFFSET  equ 4090
FIRST   equ (scan-OFFSET+IVAL)
n       equ 3
LEN     equ (data-comp+1+CDIST+1+n)
BDIST   equ ((CDIST+n)/2)

redo    mov #BDIST      ,count
scan    sub data        ,@split
comp    cmp redo-CDIST  ,redo
        slt #LEN        ,@split
        djn scan        ,<OFFSET
        mov jump        ,@comp
split   mov bomb        ,<comp
        mov bomb        ,<comp
count   djn split       ,#BDIST
        add #BDIST+BDIST,@split
        jmz redo        ,redo-1
bomb    spl 0           ,<incr-IVAL
incr    mov data        ,<count
jump    jmp incr        ,<incr-IVAL
data    DAT <0-IVAL     ,<0-IVAL

        end scan

