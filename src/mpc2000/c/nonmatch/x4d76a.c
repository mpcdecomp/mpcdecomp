/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C0_B_0D7DD;
extern char C0_TBL_08E72[1];
extern char C0_TBL_08E74[1];
extern long C0_W_0D7C2;
extern int C0_W_0D7C4;
extern unsigned char C1_B_0D7D9;
void __far far_4B16C(long, int, int);

void __far __fastcall __loadds far_4D16A(void)
{
	if (C1_B_0D7D9 <= 1) goto br_4D77B;
	C1_B_0D7D9 >>= 1;
br_4D77B:
	far_4B16C(C0_W_0D7C2, *(int *)(C0_TBL_08E72 + C0_B_0D7DD * 4), *(int *)(C0_TBL_08E74 + C0_B_0D7DD * 4));
}
