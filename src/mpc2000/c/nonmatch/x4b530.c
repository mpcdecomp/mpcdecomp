/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_01AA0[1];
extern int C2_W_END_FINE_CURSOR;
void __far far_4A5E8(char far *);

void __far L_4B530(void)
{
	C2_W_END_FINE_CURSOR = 0;
	far_4A5E8(C2_W_01AA0);
}
