/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
void __far far_4B16C(char far *, long);

void __far far_4B766(void)
{
	far_4B16C(C0_W_0D7C2, *(long far *)(C0_W_0D7C2 + 42) - *(long far *)(C0_W_0D7C2 + 50));
}
