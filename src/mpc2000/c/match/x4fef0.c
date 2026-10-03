#include "mpc2kxl.h"

extern char C2_TBL_0392C[1];

void __far L_4FEF0(void)
{
	((int (__far *)(void))*(long *)(C2_TBL_0392C + C2_W_VELOCITY_MOD_CURSOR * 42))();
	disp_request_flush();
}
