/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C0_B_0D7DD[1];
extern char C1_B_0D7DC;
extern char C2_W_02920[1];
extern long C2_W_0292A;
extern int C2_W_ZONE_CURSOR;
void __far ui_field_engine(char far *, char far *);

void __far L_4D654(void)
{
	C2_W_ZONE_CURSOR = 4;
	C2_W_0292A = (long)C1_B_0D7DC;
	ui_field_engine(C2_W_02920, C0_B_0D7DD);
}
