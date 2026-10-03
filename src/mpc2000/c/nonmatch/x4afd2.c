/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern unsigned char C1_B_0D7D9;
void __far far_4B16C(char far *, long);

void __far __fastcall __loadds L_4AFD2(void)
{
	if (C1_B_0D7D9 <= 1) goto br_4AFE3;
	C1_B_0D7D9 >>= 1;
br_4AFE3:
	far_4B16C(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 38));
}
