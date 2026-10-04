/* differs: XL v1.20 +17, 43 bytes */
extern char C2_B_CONV_MPC60_PAD;
extern char C2_B_PAD_NOTE;
extern char C2_TBL_010EA[1];
extern char C2_W_01088[1];
extern unsigned C2_W_CONV_TABLE_CURSOR;
void __far handler_set_install(char far *);
char far * __far int4D_sample_wrapper(void);

void __far far_47004(void)
{
	int si_;

	handler_set_install(C2_W_01088);
	C2_B_CONV_MPC60_PAD = 0;
	int4D_sample_wrapper();
	si_ = C2_B_CONV_MPC60_PAD;
	C2_B_PAD_NOTE = int4D_sample_wrapper()[si_];
	if (C2_W_CONV_TABLE_CURSOR < 0) goto L_466E3;
	if ((unsigned)C2_W_CONV_TABLE_CURSOR < 2) goto br_4703F;
L_466E3:
	C2_W_CONV_TABLE_CURSOR = 0;
br_4703F:
	((int (__far *)(void))*(long *)(C2_TBL_010EA + C2_W_CONV_TABLE_CURSOR * 42))();
}
