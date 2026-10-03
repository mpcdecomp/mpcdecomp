/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C0_B_0D7DD;
extern char C0_TBL_08E72[1];
extern char C0_TBL_08E74[1];
extern long C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C2_TBL_029D6[1];
extern char C2_W_0294A[1];
extern int C2_W_08D5A;
void __far far_4B16C(long, int, int);
void __far handler_set_install(char far *);

void __far L_4D71E(void)
{
	handler_set_install(C2_W_0294A);
	if (C2_W_08D5A < 0) goto br_4D738;
	if ((unsigned)C2_W_08D5A < 2) goto br_4D73E;
br_4D738:
	C2_W_08D5A = 0;
br_4D73E:
	far_4B16C(C0_W_0D7C2, *(int *)(C0_TBL_08E72 + C0_B_0D7DD * 4), *(int *)(C0_TBL_08E74 + C0_B_0D7DD * 4));
	((int (__far *)(void))*(long *)(C2_TBL_029D6 + C2_W_08D5A * 42))();
}
