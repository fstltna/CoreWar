;redcode-94nop verbose
;name QUILT
;author PBT
;strategy tetht/larn
;         This is Piltdown (35) with KafuFFle [JMetcalf] QS.
;kill QUILT
;bench c=123#250 mps=139#1000 w=163#400 o=158#400 lk=127#250

for CORESIZE==8000
 ;assert (CORESIZE==8000)
 ;assert (MAXLENGTH==100) && (MINDISTANCE==100)
 ;assert (MAXCYCLES==80000)
 ;assert (MAXPROCESSES==8000)
rof
for CORESIZE==55440
 ;assert (CORESIZE==55440) 
 ;assert (MAXPROCESSES>=8)
 ;assert (MAXCYCLES==500000)
 ;assert (MAXLENGTH==200) && (MINDISTANCE==200)
rof

       MOV.B  # -2128, * -2936     
       SPL.B  #  2935, # -2937     
       DJN.F  $    -8, <     6     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       MOV.I  @     1, }    -9     
       MOV.I  $    -8, >   -10     
       ADD.F  $   -10, @    -1     
       JMZ.B  $    -3, $  1052     
       SPL.B  $     7, $  1051     
       SUB.B  @    -1, $     3     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     3, $  2918     
       DAT.F  <   -15, $    20     
       DAT.F  <   -15, $    20     
       SPL.B  # -2670, $    30     
       MOV.I  @     2, >    -4     
       MOV.I  @     1, >    -5     
       DJN.B  $    -2, {    -3     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  }     1, }     0     
       MOV.A  # -1872, $  2887     
       MOV.I  <  3333, $    -1     
       JMP.B  $   -42, {     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
START  SEQ.I  $   581, $   259     
       DJN.F  $    33, {   587     
       SEQ.I  $  1689, $  1367     
       DJN.F  $    30, {  1695     
       SEQ.I  $  1465, $  1143     
       JMP.B  $    28, <    36     
       SEQ.I  $  1907, $  1585     
       JMP.B  $    26, >    34     
       SEQ.I  $  2349, $  2027     
       DJN.B  $    24, {    24     
       SEQ.I  $  2569, $  2247     
       JMN.B  $    22, {    22     
       SEQ.I  $  1013, $   691     
       DJN.F  >    20, {  1019     
       SEQ.I  $   789, $   467     
       JMN.B  >    18, {    17     
       SEQ.I  $  1231, $   909     
       JMN.B  >    16, }    15     
       SEQ.I  $  3005, $  2683     
       JMN.B  $    13, {    13     
       SEQ.I  $  3669, $  3347     
       JMP.B  $    11, <    20     
       SEQ.I  $ -3001, $ -3323     
       JMP.B  $     9, >    18     
       SEQ.I  $ -2337, $ -2659     
       JMN.B  $     7, }     7     
       SEQ.I  $ -1673, $ -1995     
       DJN.B  $     5, {     6     
       SEQ.I  $ -1009, $ -1331     
       JMN.B  $     3, {     4     
       SNE.I  $ -3675, $ -3997     
       JMZ.F  $   -40, $ -3686     
       MUL.AB #     3, $     5     
       MUL.B  $     8, @    -1     
       SNE.I  > -2891, >     3     
       ADD.AB #   322, $     2     
       MOV.I  *     1, <     1     
       MOV.I  $     4, }   222     
       SUB.AB #     6, @    -2     
       DJN.B  $    -3, #    11     
       DJN.F  $   -49, <    10     
       DAT.F  {    67, {     6     

   END      START

