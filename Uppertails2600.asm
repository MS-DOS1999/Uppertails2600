
    include vcs2600.h
    org $F000

; ************ DECLARATION DES ETIQUETTES ************

Dmissile = 128 ; D�but du missile
Fmissile = 129 ; Fin du missile
Dbombe   = 130 ; D�but de la bombe
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
    SEI          ; Ne modifiez rien � ces
    CLD          ; lignes car elles
    LDX #255     ; initialisent le syst�me
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
    LDA #2       ; Ne changez rien � ces
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
    INX          ; Incr�mente X
    CPX #36      ; Compare X � 32
    BNE Boucle1  ; S'il pas �gal, saute � boucle1

; ******* AFFICHAGE DU MISSILE ET DE LA BOMBE ********

    LDA #14      ; Charge 14 dans A
    STA COLUP0   ; Met A comme couleur du player0

    LDX #0       ; Initialise X
Boucle2          ; Etiquette pour effectuer un saut
    STA WSYNC    ; Attend la fin de la ligne

; ****** AFFICHAGE DU MISSILE

    CPX Dmissile ; Compare X � Dmissile
    BNE Pdm      ; Si pas �gal, saute � Pdm
    LDA #8       ; Met 8 dans A
    STA GRP0     ; Met A dans Graphismes du PLAYER0
    JMP Pfm      ; Saute � Pfm
Pdm              ; Etiquette pour Pas D�but Missile
    CPX Fmissile ; Compare X � Fmissile
    BNE Pfm      ; Si pas �gal, saute � Pfm
    LDA #0       ; Charge 0 dans A
    STA GRP0     ; Met 0 dans Graphisme PLAYER0
Pfm              ; Etiquette pour Pas Fin Missile

    ; ****** AFFICHAGE DE LA BOMBE

    CPX Dbombe   ; Compare X � Dbombe
    BNE Pdb      ; Si != saute � Pdb (pas de bombe)
    LDA #255     ; Charge 255 dans l'accu
    STA GRP1     ; Que l'on met en graph du player1
    JMP Pfb      ; Saute � Pfb (pas fin bombe)
Pdb              ; �tiquette (pas de bombe)
    CPX Fbombe   ; Compare X � Fbombe
    BNE Pfb      ; Si != saute � Pfb (pas fin bombe)
    LDA #0       ; Charge 0 dans l'accu
    STA GRP1     ; Que l'on met en graph du player1
Pfb              ; �tiquette (pas fin bombe)

    INX          ; Incr�mente X de 1 (X=X+1)
    CPX #128     ; Compare X � 128
    BNE Boucle2  ; Si diff�rent, saute � Boucle2

; **************** FIN DE LA BOUCLE 2 ****************

; ******* AFFICHAGE DU VAISSEAU ET DE LA CITE ********

    LDA #$40     ; Charge $40 dans l'accu
    STA COLUP0   ; pour la couleur du coeur
    LDX #0       ; Initialise X : compteur de lignes
Boucle3          ; �tiquette
    STA WSYNC    ; Attend la fin du balayage
                 ; de la ligne
    LDA Gcite,X  ; Met le contenu de Gcite+X dans A
    STA PF0      ; Met A dans PF0   ;    pour les
    STA PF1      ; Met A dans PF1   ;    graphismes
    STA PF2      ; Met A dans PF2   ;    de la cit�
    LDA Ccite,X  ; Met le contenu de Ccite+X dans A
    STA COLUPF   ; A dans COLUPF pour coul de cit�
    LDA Coeur,X   ; Met le contenu de coeur+X dans A
    STA GRP0     ; Pour graphisme du coeur
    INX          ; Incr�mente X (X=X+1)
    CPX #17      ; Compare X � 17
    BNE Boucle3  ; Si X!=17 saute � Boucle3

; ********** ZONE DE ROUTINE DE DEPLACEMENTS *********

; ********* DEPLACEMENTS DU JOUEUR (PLAYER0) *********

    LDA #0       ; Met 0 dans l'accu
    STA GRP0
    STA HMP0     ; Annule le d�placement du PLAYER0
Joydroite        ; Test si le joystick est � droite
    LDA #0
    STA HMP0
    LDA SWCHA    ; Met le contenu de SWCHA dans A
    AND #128     ; Filtre le bit 7
    CMP #0       ; Compare A � 0 (0=oui � droite)
    BNE Joygauche; Si pas �gal, saute � Joygauche
    LDA #255     ; Valeur pour aller � droite...
    STA HMP0     ; ...pour le d�placement du PLAYER0

Joygauche        ; Test si le joystick est � gauche
    LDA SWCHA    ; Met le contenu de SWCHA dans A
    AND #64      ; Filtre le bit 6
    CMP #0       ; Compare A � 0 (0=oui � gauche)
    BNE Finjoy   ; Si pas �gal, alors saute � Finjoy
    LDA #16      ; Valeur pour aller � gauche
    STA HMP0     ; ...pour le d�placement du PLAYER0
Finjoy           ; Fin de routine du joystick
; ******************** ROUTINE DE TIR ****************
    LDA INPT4    ; Met contenu de INPT4 dans A
    BMI Pastir   ; Si bouton pas press�, saut � Pastir
    LDA #125     ; Sinon, charge 125 dans l'accu
    STA Dmissile ; Met A dans Dmissile
    LDA #135     ; Charge 135 dans l'accu
    STA Fmissile ; Met A dans Fmissile
Pastir           ; Etiquette Pastir
    LDA Dmissile ; Charge Dmissile dans A
    CMP #126     ; Si le missile n'est pas tir�
    BEQ Pdeplm   ; Le missile ne se d�place pas
    DEC Dmissile ; D�cr�mente Dmissile 4 x
    DEC Dmissile ; pour le d�placer rapidement
    DEC Dmissile ; 
    DEC Dmissile ; 
    DEC Fmissile ; D�cr�mente Fmissile 4 x
    DEC Fmissile ; pour le d�placer rapidement
    DEC Fmissile ; 
    DEC Fmissile ; 

    LDA Dmissile ; Charge Dmissile dans l'accu
    CMP #1       ; Compare l'acccu � 1
    BNE Paschoc  ; Si != saute � Paschoc
    LDA #126     ; sinon charge 126 dans l'accu
    STA Dmissile ; et le met dans Dmissile
Paschoc          ; Pas de choc du missile sur le virus
Pdeplm           ; Pas D�placement Missile

    INC Dbombe   ; La d�but de la bombe descend
    INC Fbombe   ; La fin aussi
    LDA Fbombe   ; On charge Fbombe dans l'accu
    CMP #126     ; on le compare � 126
    BNE Pastombe ; Si != alors saute � Pastombe
    LDA #0       ; Sinon, charge 0 dan l'accu
    STA Dbombe   ; Que l'on met dans Dbombe
    LDA #10      ; On charge 10 dans l'accu
    STA Fbombe   ; Que l'on met dans Fbombe
Pastombe

; ** TEST DE COLLISION DE LA BOMBE ET DU MISSILE

    LDA CXPPMM   ; Registre des collisions
    AND #128     ; Filtre le bit 7, collisions
                 ; entre le PLAYER0 et le PLAYER1
    CMP #128     ; Compare � 128
    BNE Pascollision ; si != saute � Pascollision
    STA CXCLR    ; sinon, Initialise les collisisons

    LDX Dbombe   ; et d�place horizontalement la bombe
Bouclehasard     ; Ce principe sera expliqu�
    DEX          ; ult�rieurement
    CPX #0       ; 
    BNE Bouclehasard ; si != saute � Bouclehasard
    STA RESP1    ; On place le player1 ailleurs !
    LDA #0       ; Charge 0 dans l'accu pour...
    STA Dbombe   ; initialiser le d�but de la bombe
    LDA #10      ; Charge 10 dans l'accu pour...
    STA Fbombe   ; initialiser la fin de la bombe
    LDA #126     ; Charge 126 dans l'accu pour...
    STA Dmissile ; initialiser le d�but du misssile.
Pascollision     ; Etiquette

; **************** FIN DE L'AFFICHAGE ****************

; ****************** ON JOUE LE SON ******************

    LDA Dmissile; On utilise la position du missile
    ADC #4      ;  � laquelle on ajoute 4
    STA AUDV0   ; Dans le registre de volume
    LDA #9      ; Type de son
    STA AUDC0   ; Dans le registre de type de son
    LDA Dmissile; On utilise la position du missile
    STA AUDF0   ; Dans le registre de fr�quence

    LDA #4      ; Volume faible
    STA AUDV1   ; dans le registre de volume
    LDA #6      ; son pur
    STA AUDC1   ; dans le registre de type de son
    LDA Dbombe  ; On utilise la position de la bombe
    LSR         ; que l'on divise par deux
    LSR         ; que l'on divise par deux
    STA AUDF1   ; pour le registre de note

    STA HMOVE    ; Le simple fait d'�crire dans HMOVE
                 ; effectue le d�placement du PLAYER0
                 ; � gauche ou � droite en fonction
                 ; de la valeur mise dans HMP0
    LDX #34      ; On compte les 36 lignes d'overscan
Boucle4          ; Etiquette
    STA WSYNC    ; Attend la fin de la ligne
    DEX          ; D�cr�mente X
    CPX #0       ; Si X est difff�rent � 0
    BNE Boucle4  ; On branche � Boucle4
    JMP MainLoop ; Saute � Mainloop

    org $FFFC    ; Ces trois lignes servent �
    .word Start  ; d�clarer � la VCS � quelle adresse
    .word Start  ; commence le programme.
