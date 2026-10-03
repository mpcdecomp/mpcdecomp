/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_01D04[1];
extern int C2_W_LOOP_END_FINE_CURSOR;
void __far far_4AC96(char far *);

void __far L_4B99C(void)
{
	C2_W_LOOP_END_FINE_CURSOR = 1;
	far_4AC96(C2_W_01D04);
}
