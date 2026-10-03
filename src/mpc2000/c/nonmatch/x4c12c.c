/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C2_W_0211A[1];
void __far ui_field_engine(char far *, char far *);

void __far L_4B7CE(void)
{
	ui_field_engine(C2_W_0211A, C0_W_0D7C2 + 0x12);
}
