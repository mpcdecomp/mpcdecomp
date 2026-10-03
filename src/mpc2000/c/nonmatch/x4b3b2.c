/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern char C2_TBL_01AAE[1];
extern char C2_W_01A16[1];
extern int C2_W_END_FINE_CURSOR;
void __far far_4B16C(char far *, long);
void __far handler_set_install(char far *);

void __far L_4B3B2(void)
{
	handler_set_install(C2_W_01A16);
	if (C2_W_END_FINE_CURSOR < 0) goto br_4B3CC;
	if ((unsigned)C2_W_END_FINE_CURSOR < 3) goto br_4B3D2;
br_4B3CC:
	C2_W_END_FINE_CURSOR = 0;
br_4B3D2:
	far_4B16C(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42));
	((int (__far *)(void))*(long *)(C2_TBL_01AAE + C2_W_END_FINE_CURSOR * 42))();
}
