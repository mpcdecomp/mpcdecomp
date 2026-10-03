/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_01BA8[1];
extern int C2_W_LOOP_FINE_CURSOR;
void __far far_4A9DE(char far *);

void __far L_4B752(void)
{
	C2_W_LOOP_FINE_CURSOR = 0;
	far_4A9DE(C2_W_01BA8);
}
