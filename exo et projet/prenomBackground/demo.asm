;********************* Dessin ligne*************************
    include vcs2600.h
    org $F000
Start
    SEI
    CLD
    LDX #$FF
    TXS
    LDA #0
B1  STA 0,X
    DEX
    BNE B1

MainLoop
    LDA #2
    STA WSYNC  
    STA WSYNC
    STA WSYNC
    STA VSYNC
    STA WSYNC
    STA WSYNC
    LDX #53
    STX TIM64T
    LDA #0
    STA  WSYNC
    STA  VSYNC
    LDA #0
    STA CXCLR
    LDA #1
    STA CTRLPF
DrawScreen   
    LDA INTIM
    BNE DrawScreen
    STA WSYNC
    STA VBLANK
;********************* DEBUT AFFICHAGE *********************

;****PREMIERE RANGÉ DE LETTRE "J" "U"****
    LDA #0
    STA PF0
    STA PF1
    STA PF2

    STA WSYNC
    LDA #$32
    STA COLUPF
    LDA #224
    STA PF0
    LDA #193
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #224
    STA PF0
    LDA #193
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #224
    STA PF0
    LDA #193
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #128
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #144
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #144
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #144
    STA PF0
    LDA #1
    STA PF1
    LDA #4
    STA PF2
    
    STA WSYNC
    LDA #96
    STA PF0
    LDA #0
    STA PF1
    LDA #3
    STA PF2
    
    STA WSYNC
    LDA #96
    STA PF0
    LDA #0
    STA PF1
    LDA #3
    STA PF2
    
    STA WSYNC
    LDA #96
    STA PF0
    LDA #0
    STA PF1
    LDA #3
    STA PF2
    
;****DEUXIÈME RANGÉ DE LETTRE "L" "I"****
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #0
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #0
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #0
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #0
    STA PF1
    LDA #2
    STA PF2
    
;****TROISIÈME RANGÉ DE LETTRE "E" "N"****
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    


    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    

    STA WSYNC
    LDA #240
    STA PF0
    LDA #194
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #194
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #194
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #3
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #3
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #3
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #2
    STA PF1
    LDA #9
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #2
    STA PF1
    LDA #9
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #2
    STA PF1
    LDA #9
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #2
    STA PF1
    LDA #10
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #2
    STA PF1
    LDA #10
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #2
    STA PF1
    LDA #10
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #2
    STA PF1
    LDA #12
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #2
    STA PF1
    LDA #12
    STA PF2
    
    STA WSYNC
    LDA #16
    STA PF0
    LDA #2
    STA PF1
    LDA #12
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #194
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #194
    STA PF1
    LDA #8
    STA PF2
    
    STA WSYNC
    LDA #240
    STA PF0
    LDA #194
    STA PF1
    LDA #8
    STA PF2
    
    
    
    STA WSYNC
    LDA #0
    STA PF0
    STA PF1
    STA PF2
    
    
; ******************* FIN DE L'AFFICHAGE ******************
    LDY #200
NTSC2
    DEY
    BNE NTSC2
    LDX #36

NTSC3          
    STA WSYNC
    DEX
    BNE NTSC3
    JMP MainLoop
    org $FFFC
    .word Start
    .word Start