/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C0_B_098B8;
extern char far *C2_FP_0117A;
extern char C2_W_01130[1];
void __far handler_set_install(char far *);

void __far tgt_47992(void)
{
	handler_set_install(C2_W_01130);
	C0_B_098B8 = 0;
	((int (__far *)(void))C2_FP_0117A)();
}
