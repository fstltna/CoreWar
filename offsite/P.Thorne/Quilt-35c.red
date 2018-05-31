;redcode-94nop verbose
;name QUI*T
;author Philip Thorne
;strategy 200211040149 Quick Piltdown: QS -> 1SB -> Clear
; quilt-35c.red
; This is Piltdown 35 [vbmb chgd, pbmb out] + reduced KafuFFle QS
;kill QUI*T
;bench oct=134#2000
;
;assert (CORESIZE==8000)
;assert (MAXLENGTH==100) && (MINDISTANCE==100)
;assert (MAXCYCLES==80000) && (MAXPROCESSES>=8)

       MOV.B  # -2128, * -2936     
       SPL.B  #  2935, # -2937     
       DJN.F  $    -8, {     6     
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
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       MOV.A  # -1872, $  2879     
       JMP.B  $   -49, {     0     
START  SEQ.I  $   577, $   255     
       DJN.F  $    29, {   581     
       SEQ.I  $  1685, $  1363     
       DJN.F  $    26, {  1689     
       SEQ.I  $  1461, $  1139     
       JMP.B  $    24, <    32     
       SEQ.I  $  1903, $  1581     
       JMP.B  $    22, >    30     
       SEQ.I  $  2345, $  2023     
       DJN.B  $    20, {    20     
       SEQ.I  $  2565, $  2243     
       JMN.B  $    18, {    18     
       SEQ.I  $  1009, $   687     
       DJN.F  >    16, {  1013     
       SEQ.I  $   785, $   463     
       JMN.B  >    14, {    13     
       SEQ.I  $  1227, $   905     
       JMN.B  >    12, }    11     
       SEQ.I  $  3001, $  2679     
       JMN.B  $     9, {     9     
       SEQ.I  $  3665, $  3343     
       JMP.B  $     7, <    16     
       SEQ.I  $ -3005, $ -3327     
       JMP.B  $     5, >    14     
       SEQ.I  $ -2341, $ -2663     
       JMN.B  $     3, }     3     
       SNE.I  $ -3675, $ -3997     
       JMZ.F  $   -29, $ -3686     
       MUL.AB #     3, $     5     
       MUL.B  $     8, @    -1     
       SNE.I  > -2891, >     3     
       ADD.AB #   322, $     2     
       MOV.I  *     1, <     1     
       MOV.I  $     4, }   222     
       SUB.AB #     4, @    -2     
       DJN.B  $    -3, #    11     
       DJN.F  $   -38, <    10     
       DAT.F  {    45, {     6     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     
       DAT.F  $     0, $     0     

    end START

