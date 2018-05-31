;redcode-94m
;name QuestIn Time
;author Philip Thorne
;strategy Optimised QC [with credit to MN]
;   Re-optimised clear from Mike Nonemacher's Quiz
;kill QuestIn
;assert 1

cptr:   dat     <-15,       15
        dat     <-15,       20
        dat     <-15,       20
clr     spl     #-2670,     35
        mov.i   @2,         >cptr
        mov.i   @1,         >cptr
        djn.b   -2,         {clr

 end clr

