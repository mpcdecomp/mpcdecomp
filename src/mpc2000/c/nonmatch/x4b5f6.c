/* differs: XL v1.20 +6, 30 bytes */
extern char far *C0_W_0D7C2;
extern unsigned char C1_B_0D7D9;
void __far far_4B16C(char far *, long);

void __far __fastcall __loadds far_4B5F6(void)
{
	if (C1_B_0D7D9 <= 1) goto br_4B61B;
	C1_B_0D7D9 >>= 1;
br_4B61B:
	far_4B16C(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42) - *(long far *)(C0_W_0D7C2 + 50));
}
