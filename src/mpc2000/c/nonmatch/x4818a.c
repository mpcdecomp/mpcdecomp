/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern unsigned char C2_B_08B2E;
extern char far *C2_W_FE_DESC_OFF;

void __far __fastcall __loadds field_digit_cursor_inc(void)
{
	if ((unsigned char)C2_W_FE_DESC_OFF[3] <= C2_B_08B2E + 1) goto br_481A9;
	C2_B_08B2E++;
br_481A9:
	;
}
