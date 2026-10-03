/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C2_FP_0269A;
extern char C2_W_02606[1];
extern int C2_W_TS_CURSOR;
void __far handler_set_install(char far *);

void __far far_4CD4C(void)
{
	handler_set_install(C2_W_02606);
	C2_W_TS_CURSOR = 0;
	((int (__far *)(void))C2_FP_0269A)();
}
