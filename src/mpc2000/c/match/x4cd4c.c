#include "mpc2kxl.h"

extern char far *C2_FP_0269A;
extern char C2_W_02606[1];

void __far far_4CD4C(void)
{
	handler_set_install(C2_W_02606);
	C2_W_TS_CURSOR = 0;
	((int (__far *)(void))C2_FP_0269A)();
}
