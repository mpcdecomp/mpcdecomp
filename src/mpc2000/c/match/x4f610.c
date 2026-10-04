#include "mpc2kxl.h"

extern char far *C2_FP_036E0;
extern char C2_W_03686[1];

void __far L_4F610(void)
{
	handler_set_install(C2_W_03686);
	((int (__far *)(void))C2_FP_036E0)();
}
