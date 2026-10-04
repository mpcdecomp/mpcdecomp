/* differs: XL v1.20 +13, 1 bytes */
extern unsigned C0_W_02B57;

void __far __fastcall intcb_32691(int a0)
{
	if ((char)a0 != 2) goto L_32893;
	if (C0_W_02B57 < 0xc8) goto L_32893;
	C0_W_02B57 = 0xc8;
L_32893:
	;
}
