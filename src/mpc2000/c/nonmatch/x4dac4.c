/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C0_B_0D7DD;
extern char C0_TBL_08E76[1];
extern char C0_TBL_08E78[1];
extern long C0_W_0D7C2;
extern int C0_W_0D7C4;
void __far far_4B16C(long, int, int);

void __far L_4DAC4(void)
{
	far_4B16C(C0_W_0D7C2, *(int *)(C0_TBL_08E76 + C0_B_0D7DD * 4), *(int *)(C0_TBL_08E78 + C0_B_0D7DD * 4));
}
