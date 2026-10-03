/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern unsigned char C1_B_0D7D9;
void __far far_4B16C(char far *, long);

void __far __fastcall __loadds far_4B866(void)
{
	if (C1_B_0D7D9 >= 0x40) goto br_4B877;
	C1_B_0D7D9 <<= 1;
br_4B877:
	far_4B16C(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42));
}
