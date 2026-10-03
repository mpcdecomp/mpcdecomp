/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C2_TBL_01BB6[1];
extern char C2_W_01B1E[1];
extern int C2_W_LOOP_FINE_CURSOR;
void __far far_4B16C(char far *, long);
void __far handler_set_install(char far *);

void __far L_4AF96(void)
{
	long l4;

	l4 = *(long far *)(C0_W_0D7C2 + 42) - *(long far *)(C0_W_0D7C2 + 50);
	handler_set_install(C2_W_01B1E);
	if (C2_W_LOOP_FINE_CURSOR < 0) goto br_4B5CE;
	if ((unsigned)C2_W_LOOP_FINE_CURSOR < 4) goto br_4B5D4;
br_4B5CE:
	C2_W_LOOP_FINE_CURSOR = 0;
br_4B5D4:
	far_4B16C(C0_W_0D7C2, l4);
	((int (__far *)(void))*(long *)(C2_TBL_01BB6 + C2_W_LOOP_FINE_CURSOR * 42))();
}
