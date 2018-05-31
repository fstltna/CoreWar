;redcode-94
;name T-Frez
;author Neogryzor
;assert CORESIZE==800

;STRATEGY	Tiny multi-shot scanner

	;step equ 10
	d1 equ 70+10
	d2 equ d1+5
	ptr equ loop-1

;ptr:	dat 0,0

loop:	add.f inc,scan
scan:	sne.i d1,d2		;<- Ref
	djn.f loop,{-115
	mov.ab scan,ptr
	spl loop,-40		;<-ptr?
clr:	mov *dbm,>ptr
	mov *dbm,>ptr
	djn.f clr,<-3
dbm:	dat 1,11
sbm:	spl #10,10
inc:	spl #70,70
for 3
	dat 0,0
rof
i for 6
	spl #20+i,<50
rof

	end scan

