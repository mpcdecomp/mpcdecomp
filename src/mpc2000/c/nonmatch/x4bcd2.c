/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_01E6A[1];
extern int C2_W_LOOP_CURSOR;
void __far far_4A9DE(char far *);

void __far loop_focus_to(void)
{
	C2_W_LOOP_CURSOR = 2;
	far_4A9DE(C2_W_01E6A);
}
