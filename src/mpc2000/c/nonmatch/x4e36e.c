/* differs: XL v1.20 +1, 66 bytes */
extern long C0_W_0D7C2;
extern unsigned char C2_B_PAD_DRUM;
extern int C2_B_PAD_NOTE;
extern char EP_PGM_ASSIGN_SCREEN_DRAW_OFF[1];
extern char EP_PGM_ASSIGN_SCREEN_DRAW_SEG[1];
void __far far_4C0D8(char __near *, char __near *);
char far * __far ivt_get_vector(int);

void __far L_4DD6E(void)
{
	int si_;
	char far *v0;

	si_ = C2_B_PAD_NOTE;
	si_ &= 0xff;
	v0 = ivt_get_vector(C2_B_PAD_DRUM + 0x5c);
	C0_W_0D7C2 = *(long far *)(v0 + si_ * 4 + 1874);
	far_4C0D8(EP_PGM_ASSIGN_SCREEN_DRAW_OFF, EP_PGM_ASSIGN_SCREEN_DRAW_SEG);
}
