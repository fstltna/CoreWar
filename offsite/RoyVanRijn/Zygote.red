;redcode-88
;name Zygote
;author Roy van Rijn
;strategy Tournament Warrior (Valentine tournament 2015)
;assert 1

wgo  spl stone
        spl stone
        spl stone
        spl stone
        spl stone
        spl stone
        spl stone

pboot spl 1, <163
      spl 1, <2363
      mov -1,0

paper add #7,7
      mov <-1,<1
      spl @0,7349
      mov bomb,<-1
      mov bomb,<3
      jmz paper,paper
bomb  dat <2667,<5334

dat #0,#6000

dat #0,#0
dat #0,#0
dat #0,#0
dat #0,#0

stone   spl 0             , <1761
        mov sbomb         , <-3023
        mov sbomb         , @-1
        add #-107         , -2
        djn -3            , <1350

dat #0,#0
dat #0,#0

sbomb   dat <1            , #17

end wgo
