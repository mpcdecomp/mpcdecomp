/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_B_0D7CE;
void __far far_49308(int);
void __far far_493D2(void);
void __far far_4EE54(int);

void __far L_48EFC(char p0)
{
	C2_B_0D7CE = p0;
	far_493D2();
	far_4EE54(0x32);
	far_49308(0);
}
