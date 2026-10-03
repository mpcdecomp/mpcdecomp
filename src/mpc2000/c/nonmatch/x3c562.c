/* differs: XL v1.20 +7, 46 bytes */
extern char C0_B_0D7C1;
extern int C0_W_03EDA;
int __near fn_3CA58(void);

void __far __fastcall __loadds far_3C562(void)
{
	int si_;

	si_ = C0_B_0D7C1 & 0xf;
	si_ |= si_;
	if (si_ <= 0) goto br_3C59C;
	si_--;
	C0_B_0D7C1 = ((unsigned char)C0_B_0D7C1 >> 4 << 4) + (char)si_;
	if (fn_3CA58() > 1) goto br_3C59C;
	C0_W_03EDA = 1 << (char)si_;
br_3C59C:
	;
}
