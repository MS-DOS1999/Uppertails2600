;*****************sprite uppertails****************

	include vcs2600.h
	org $F000



Coeur
	BYTE. 68,238,238,254,254,124,124,56,56,16,16


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
	STA WSYNC
	STA VSYNC
	STA CXCLR
	LDA #1
	STA CTRLPF

DrawScreen
	LDA INTIM
	BNE DrawScreen
	STA WSYNC
	STA VBLANK

;********************debut affichage*****************
	LDA 128
	STA COLUP0
	LDX #0

Boucle
	LDA Coeur,X
	STX COLUBK
	STA GRP0
	STA WSYNC
	INX
	CPX #11
	BNE Boucle

	LDA #0
	STA GRP0

	LDX #0

Boucle2
	INX
	STA WSYNC
	STX COLUBK
	CPX #217
	BNE Boucle2

;**************mouvement*****************************

	LDA #0
	STA HMP0

Joy_droite
	LDA SWCHA
	AND #128
	CMP #0
	BNE Joy_gauche
	LDA #255
	STA HMP0

Joy_gauche
	LDA SWCHA
	AND #64
	CMP #0
	BNE Joy_bas
	LDA #16
	STA HMP0

Joy_bas
	LDA SWCHA
	AND #32
	CMP #0
	BNE Joy_haut
	DEC 128

Joy_haut
	LDA SWCHA
	AND #16
	CMP #0
	BNE Bouge
	INC 128

Bouge
	STA HMOVE


;****************fin affichage***********************

	LDA #0
	STA COLUBK
	LDX #36
NTSC3
	STA WSYNC
	DEX
	BNE NTSC3
	JMP MainLoop
	org $FFFC
	.word Start
	.word Start










