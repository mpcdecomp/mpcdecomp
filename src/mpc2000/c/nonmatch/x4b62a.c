/* differs: XL v1.20 +6, 29 bytes */
extern char far *C0_W_0D7C2;
extern unsigned char C1_B_0D7D9;
void __far far_4B16C(char far *, long);

void __far __fastcall __loadds far_4B62A(void)
{
	if (C1_B_0D7D9 >= 0x40) goto br_4B64F;
	C1_B_0D7D9 <<= 1;
br_4B64F:
	far_4B16C(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42) - *(long far *)(C0_W_0D7C2 + 50));
}
