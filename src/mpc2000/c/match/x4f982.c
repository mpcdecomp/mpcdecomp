#include "mpc2kxl.h"

extern char far *C0_FP_03762;

void __far L_4F982(void)
{
	((int (__far *)(void))C0_FP_03762)();
	disp_request_flush();
}
