;REDCODE
;name G008W041
;author RC94 Evolover
;Parents: G007W046 G007W067
org 2
DAT.I  $0016,>4260
JMZ.F  >2098,>0048
SPL.F  #0021,@0026
SUB.A  <0016,#2078
SPL.F  #0021,@4122
SPL.BA  #0021,@0026
SPL.F  >4129,<0017
SPL.BA  #0021,@0026
JMP.F  >1074,>1074
SUB.A  <0016,#0022
MUL.A  @0022,$0038
MOV.X  #0527,<0036
CMP.I  >8212,<0259
SPL.AB  #0016,>0000
SPL.F  #0277,@0026
SUB.A  <0016,@0030
SPL.A  #0021,@0026
SPL.BA  #0021,@0026
SPL.F  >0097,<0021
SPL.AB  #0528,>0000
SPL.F  #0021,@0026
SUB.A  <8199,@0026
SPL.F  #0021,@0026
SPL.BA  #0021,@0282
SPL.F  >0033,<0021
ADD.I  $0045,$0025
JMP.I  <0038,#0008
JMN.F  @0040,$2096
MUL.BA  >0014,<0036
MOD.I  @0041,$0025
MOV.X  #2063,<0044
DAT.I  >0009,#0044
MOD.I  @0041,$0025
MOD.I  #0021,<0047
JMP.A  <8336,<0017
MOD.I  #0021,<0047
MUL.A  <0030,$0038
SPL.B  #0046,@0047
MOD.X  #0024,<0019
MOV.X  #0015,<0036
DIV.BA  >0043,#0046
SPL.X  <0043,$0040
JMZ.I  $0031,$0002
DAT.I  @0046,#0028
CMP.B  #0046,@0045
ADD.I  >0010,$0005
CMP.B  #2606,@0047
