extern char C0_B_08B02;
extern char far *C0_FP_0087C;
extern char C0_W_007CA[1];
void __far handler_set_install(char far *);

void __near fn_395E2(char p0)
{
	C0_B_08B02 = p0;
	handler_set_install(C0_W_007CA);
	((int (__far *)(void))C0_FP_0087C)();
}
