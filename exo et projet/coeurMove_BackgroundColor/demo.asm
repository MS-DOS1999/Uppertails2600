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
	LDA #$62
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

	LDA #255
	STA HMP0
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










