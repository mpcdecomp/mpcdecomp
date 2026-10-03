/* differs: XL v1.20; the oracle matches it, the check cannot place it: data */
extern char C0_TBL_09160[1];
extern unsigned char C2_B_PAD_DRUM;
extern char EP_PGM_ASSIGN_SCREEN_DRAW_OFF[1];
extern char EP_PGM_ASSIGN_SCREEN_DRAW_SEG[1];
void __far far_4EFFA(char __near *, char __near *, char);

void __far far_4E182(void)
{
	far_4EFFA(EP_PGM_ASSIGN_SCREEN_DRAW_OFF, EP_PGM_ASSIGN_SCREEN_DRAW_SEG, C0_TBL_09160[C2_B_PAD_DRUM * 388]);
}
