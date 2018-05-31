Article 1664 of rec.games.corewar:
Path: hellgate.utah.edu!cs.utexas.edu!natinst.com!news.dell.com!swrinde!gatech!prism!gt7804b
From: gt7804b@prism.gatech.EDU (Wayne Edward Sheppard)
Newsgroups: rec.games.corewar
Subject: Coreclears
Message-ID: <87261@hydra.gatech.EDU>
Date: 1 Mar 93 20:37:48 GMT
Organization: Georgia Institute of Technology
Lines: 47

There are many ways to implement a coreclear into your program.
Almost all fill the entire core with DAT after they are done
bombing or scanning.

Another way would be to change the bomb to a DAT statement,
then you could bomb all of the spots that you bombed before
using the same bombing routine.

But it is important to design it as part of your program.  You
say that you are bombing with spl 0/jmp -1.  Well one way to do this
is like this:

      add #19,1        ;This is the main bombing routine
      mov jbomb,100    ;Yours may look different.
      mov sbomb,<-1    ;
      djn -3,#100      ;After some number of bombs, stop

sbomb spl 0            ;Reuse your bombing statements
      mov 2,<-1        ;This will put a DAT #0 on every statement
jbomb jmp -1           ;Reuse your bombing statements
      dat #0

Usually you will want to bomb as much as possible before you
switch to a coreclear.  If you have a pattern bomber, then
have it bomb until it is just about to bomb yourself before
you go to a coreclear.  But always test out different constants.

Here is an example program from days gone by:

;redcode
;name Pale Shears3
;kill Pale Shears
;author Matt Hastings
;strategy Pale Shears w/ Mintardjo's Anti-IMP code
mov jb,3+156
mov sb,<-1
add #156,-2
djn -3,#1599
sb spl 0,<0
mov 2,<-4
jb jmp -1,-1
dat <-92,<-2
-- 
Wayne Edward Sheppard
Georgia Institute of Technology, Atlanta Georgia, 30332
uucp:	  ...!{decvax,hplabs,ncar,purdue,rutgers}!gatech!prism!gt7804b
Internet: gt7804b@prism.gatech.edu


