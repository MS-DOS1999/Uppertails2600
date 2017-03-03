
    include vcs2600.h
    org $F000

; ************ DECLARATION DES ETIQUETTES ************

Dmissile = 128 ; Début du missile
Fmissile = 129 ; Fin du missile
Dbombe   = 130 ; Début de la bombe
Fbombe   = 131 ; Fin de la bombe

; ************ LIGNES DE BYTE *************

Gskull
    BYTE. 0,0,0,0,0,0,192,192,240,240
    BYTE. 252,252,207,207,143,143,255,255
    BYTE. 191,191,252,252,176,176,0,0,96,96
    BYTE. 240,240,0,0,0,0,0,0
Cskull
    BYTE. 0,0,0,0,0,0,$0E,$0E,$0E,$0E
    BYTE. $0E,$0E,$0E,$0E,$0E,$0E,$0E,$0E
    BYTE. $0E,$0E,$0E,$0E,$0E,$0E,0,0,$0E,$0E
    BYTE. $0E,$0E,0,0,0,0,0,0
Gcite
    BYTE. 38,38,38,38,38,182,182
    BYTE. 182,182,255,255,0
Ccite
    BYTE. 0,0,0,0,0,0,0,0,0,0,18,0,0,0,0,0,0
    BYTE. 0,0,0,0,0,0,0,0,0,0,0,0,0
Coeur
    BYTE. 16,16,56,56,124,124,254,254,238,238,68,0,0,0,0,0,0

; ************** FIN DE ZONE DE BYTE *****************

; ************** ZONE D'INITIALIZATION ***************
           
Start
    SEI          ; Ne modifiez rien à ces
    CLD          ; lignes car elles
    LDX #255     ; initialisent le système
    TXS          ; 
    LDA #0       ; 
B1  STA 0,X      ; effacement de la RAM
    DEX          ; 
    BNE B1       ; 

Initialisation   ; 
    LDA #126     ; On charge 126 dans l'accu
    STA Dmissile ; Que l'on met dans Dmissile
    LDA #0       ; 
    STA Dbombe   ; 
    LDA #10      ; 
    STA Fbombe   ;  
    LDA #54      ; On charge 54 dans l'accu
    STA COLUP1   ; que l'on met dans COLUP1

MainLoop         ; 
    LDA #2       ; Ne changez rien à ces
    STA WSYNC    ; lignes car elles
    STA WSYNC    ; initialisent l'affichage
    STA WSYNC    ; 
    STA VSYNC    ; 
    STA WSYNC    ; 
    STA WSYNC    ; 

    LDX #53      ; 
    STX TIM64T   ;  
    LDA #0       ; 
    STA  WSYNC   ; 
    STA  VSYNC   ; 
    STA CXCLR    ; 
    LDA #1       ; 
    STA CTRLPF   ; 

DrawScreen       ; 
    LDA INTIM    ; 
    BNE DrawScreen
    STA WSYNC    ; 
    STA VBLANK   ; 

; **************** DEBUT D'AFFICHAGE *****************

; **************** AFFICHAGE DE SKULL ****************

    LDX #0       ; On initialise X
Boucle1          ; Etiquette
    LDA Cskull,X ; met le contenu de Cskull+X dans A
    STA COLUPF   ; Met A en couleur de PLAYFIELD
    LDA #0
    STA PF0
    STA PF1
    LDA Gskull,X ; Met le contenu de Gskull+X dans A
    STA PF2      ; Met A en graphisme de PLAYFIELD
    STA WSYNC    ; Attend fin de l'affichage
                 ; de la ligne
    INX          ; Incrémente X
    CPX #36      ; Compare X à 32
    BNE Boucle1  ; S'il pas égal, saute à boucle1

; ******* AFFICHAGE DU MISSILE ET DE LA BOMBE ********

    LDA #14      ; Charge 14 dans A
    STA COLUP0   ; Met A comme couleur du player0

    LDX #0       ; Initialise X
Boucle2          ; Etiquette pour effectuer un saut
    STA WSYNC    ; Attend la fin de la ligne

; ****** AFFICHAGE DU MISSILE

    CPX Dmissile ; Compare X à Dmissile
    BNE Pdm      ; Si pas égal, saute à Pdm
    LDA #8       ; Met 8 dans A
    STA GRP0     ; Met A dans Graphismes du PLAYER0
    JMP Pfm      ; Saute à Pfm
Pdm              ; Etiquette pour Pas Début Missile
    CPX Fmissile ; Compare X à Fmissile
    BNE Pfm      ; Si pas égal, saute à Pfm
    LDA #0       ; Charge 0 dans A
    STA GRP0     ; Met 0 dans Graphisme PLAYER0
Pfm              ; Etiquette pour Pas Fin Missile

    ; ****** AFFICHAGE DE LA BOMBE

    CPX Dbombe   ; Compare X à Dbombe
    BNE Pdb      ; Si != saute à Pdb (pas de bombe)
    LDA #255     ; Charge 255 dans l'accu
    STA GRP1     ; Que l'on met en graph du player1
    JMP Pfb      ; Saute à Pfb (pas fin bombe)
Pdb              ; étiquette (pas de bombe)
    CPX Fbombe   ; Compare X à Fbombe
    BNE Pfb      ; Si != saute à Pfb (pas fin bombe)
    LDA #0       ; Charge 0 dans l'accu
    STA GRP1     ; Que l'on met en graph du player1
Pfb              ; étiquette (pas fin bombe)

    INX          ; Incrémente X de 1 (X=X+1)
    CPX #128     ; Compare X à 128
    BNE Boucle2  ; Si différent, saute à Boucle2

; **************** FIN DE LA BOUCLE 2 ****************

; ******* AFFICHAGE DU VAISSEAU ET DE LA CITE ********

    LDA #$40     ; Charge $40 dans l'accu
    STA COLUP0   ; pour la couleur du coeur
    LDX #0       ; Initialise X : compteur de lignes
Boucle3          ; étiquette
    STA WSYNC    ; Attend la fin du balayage
                 ; de la ligne
    LDA Gcite,X  ; Met le contenu de Gcite+X dans A
    STA PF0      ; Met A dans PF0   ;    pour les
    STA PF1      ; Met A dans PF1   ;    graphismes
    STA PF2      ; Met A dans PF2   ;    de la cité
    LDA Ccite,X  ; Met le contenu de Ccite+X dans A
    STA COLUPF   ; A dans COLUPF pour coul de cité
    LDA Coeur,X   ; Met le contenu de coeur+X dans A
    STA GRP0     ; Pour graphisme du coeur
    INX          ; Incrémente X (X=X+1)
    CPX #17      ; Compare X à 17
    BNE Boucle3  ; Si X!=17 saute à Boucle3

; ********** ZONE DE ROUTINE DE DEPLACEMENTS *********

; ********* DEPLACEMENTS DU JOUEUR (PLAYER0) *********

    LDA #0       ; Met 0 dans l'accu
    STA GRP0
    STA HMP0     ; Annule le déplacement du PLAYER0
Joydroite        ; Test si le joystick est à droite
    LDA #0
    STA HMP0
    LDA SWCHA    ; Met le contenu de SWCHA dans A
    AND #128     ; Filtre le bit 7
    CMP #0       ; Compare A à 0 (0=oui à droite)
    BNE Joygauche; Si pas égal, saute à Joygauche
    LDA #255     ; Valeur pour aller à droite...
    STA HMP0     ; ...pour le déplacement du PLAYER0

Joygauche        ; Test si le joystick est à gauche
    LDA SWCHA    ; Met le contenu de SWCHA dans A
    AND #64      ; Filtre le bit 6
    CMP #0       ; Compare A à 0 (0=oui à gauche)
    BNE Finjoy   ; Si pas égal, alors saute à Finjoy
    LDA #16      ; Valeur pour aller à gauche
    STA HMP0     ; ...pour le déplacement du PLAYER0
Finjoy           ; Fin de routine du joystick
; ******************** ROUTINE DE TIR ****************
    LDA INPT4    ; Met contenu de INPT4 dans A
    BMI Pastir   ; Si bouton pas pressé, saut à Pastir
    LDA #125     ; Sinon, charge 125 dans l'accu
    STA Dmissile ; Met A dans Dmissile
    LDA #135     ; Charge 135 dans l'accu
    STA Fmissile ; Met A dans Fmissile
Pastir           ; Etiquette Pastir
    LDA Dmissile ; Charge Dmissile dans A
    CMP #126     ; Si le missile n'est pas tiré
    BEQ Pdeplm   ; Le missile ne se déplace pas
    DEC Dmissile ; Décrémente Dmissile 4 x
    DEC Dmissile ; pour le déplacer rapidement
    DEC Dmissile ; 
    DEC Dmissile ; 
    DEC Fmissile ; Décrémente Fmissile 4 x
    DEC Fmissile ; pour le déplacer rapidement
    DEC Fmissile ; 
    DEC Fmissile ; 

    LDA Dmissile ; Charge Dmissile dans l'accu
    CMP #1       ; Compare l'acccu à 1
    BNE Paschoc  ; Si != saute à Paschoc
    LDA #126     ; sinon charge 126 dans l'accu
    STA Dmissile ; et le met dans Dmissile
Paschoc          ; Pas de choc du missile sur le virus
Pdeplm           ; Pas Déplacement Missile

    INC Dbombe   ; La début de la bombe descend
    INC Fbombe   ; La fin aussi
    LDA Fbombe   ; On charge Fbombe dans l'accu
    CMP #126     ; on le compare à 126
    BNE Pastombe ; Si != alors saute à Pastombe
    LDA #0       ; Sinon, charge 0 dan l'accu
    STA Dbombe   ; Que l'on met dans Dbombe
    LDA #10      ; On charge 10 dans l'accu
    STA Fbombe   ; Que l'on met dans Fbombe
Pastombe

; ** TEST DE COLLISION DE LA BOMBE ET DU MISSILE

    LDA CXPPMM   ; Registre des collisions
    AND #128     ; Filtre le bit 7, collisions
                 ; entre le PLAYER0 et le PLAYER1
    CMP #128     ; Compare à 128
    BNE Pascollision ; si != saute à Pascollision
    STA CXCLR    ; sinon, Initialise les collisisons

    LDX Dbombe   ; et déplace horizontalement la bombe
Bouclehasard     ; Ce principe sera expliqué
    DEX          ; ultérieurement
    CPX #0       ; 
    BNE Bouclehasard ; si != saute à Bouclehasard
    STA RESP1    ; On place le player1 ailleurs !
    LDA #0       ; Charge 0 dans l'accu pour...
    STA Dbombe   ; initialiser le début de la bombe
    LDA #10      ; Charge 10 dans l'accu pour...
    STA Fbombe   ; initialiser la fin de la bombe
    LDA #126     ; Charge 126 dans l'accu pour...
    STA Dmissile ; initialiser le début du misssile.
Pascollision     ; Etiquette

; **************** FIN DE L'AFFICHAGE ****************

; ****************** ON JOUE LE SON ******************

    LDA Dmissile; On utilise la position du missile
    ADC #4      ;  à laquelle on ajoute 4
    STA AUDV0   ; Dans le registre de volume
    LDA #9      ; Type de son
    STA AUDC0   ; Dans le registre de type de son
    LDA Dmissile; On utilise la position du missile
    STA AUDF0   ; Dans le registre de fréquence

    LDA #4      ; Volume faible
    STA AUDV1   ; dans le registre de volume
    LDA #6      ; son pur
    STA AUDC1   ; dans le registre de type de son
    LDA Dbombe  ; On utilise la position de la bombe
    LSR         ; que l'on divise par deux
    LSR         ; que l'on divise par deux
    STA AUDF1   ; pour le registre de note

    STA HMOVE    ; Le simple fait d'écrire dans HMOVE
                 ; effectue le déplacement du PLAYER0
                 ; à gauche ou à droite en fonction
                 ; de la valeur mise dans HMP0
    LDX #34      ; On compte les 36 lignes d'overscan
Boucle4          ; Etiquette
    STA WSYNC    ; Attend la fin de la ligne
    DEX          ; Décrémente X
    CPX #0       ; Si X est diffférent à 0
    BNE Boucle4  ; On branche à Boucle4
    JMP MainLoop ; Saute à Mainloop

    org $FFFC    ; Ces trois lignes servent à
    .word Start  ; déclarer à la VCS à quelle adresse
    .word Start  ; commence le programme.
