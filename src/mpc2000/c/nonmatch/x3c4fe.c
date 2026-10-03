/* differs: XL v1.20 +10, 23 bytes */
extern char C0_B_0D7C1;
extern char far *C0_FP_03762;
void __far L_3E900(int);

void __near fn_3C4FE(int p0)
{
	L_3E900(p0);
	C0_B_0D7C1 = (C0_B_0D7C1 & 0xf) + ((char)p0 << 4);
	((int (__far *)(void))C0_FP_03762)();
}
