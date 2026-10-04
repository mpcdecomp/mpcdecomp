#include "mpc2kxl.h"

extern char far *C0_FP_0087C;
extern char C0_W_007CA[1];

void __near fn_395E2(char p0)
{
	C0_B_08B02 = p0;
	handler_set_install(C0_W_007CA);
	((int (__far *)(void))C0_FP_0087C)();
}
