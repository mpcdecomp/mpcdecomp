/* differs: 150 size 34, image 36; +20 image `pop si` CL `ret`; 172 size 34, image 36; +20 image `pop si` CL `ret` */
extern char PGM_SLOT[1];
extern char WIN_FIELD_BOX_W;
void __far L_05EEE(void);
void __far __fastcall __loadds L_06570(void);
void __far __pascal seq_write_data(char far *, int, int, int, void (far *)(void), void (far *)(void));

void __near X_0592C(void)
{
	seq_write_data(PGM_SLOT, 1, 0x1a, 2, L_05EEE, (void (far *)(void))L_06570);
	WIN_FIELD_BOX_W = 0xc;
}
