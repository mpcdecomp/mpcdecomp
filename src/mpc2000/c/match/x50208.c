#include "mpc2kxl.h"

extern char C2_TBL_03A86[1];

void __far L_4F8A8(void)
{
	((int (__far *)(void))*(long *)(C2_TBL_03A86 + C2_W_VELO_ENV_FILTER_CURSOR * 42))();
	disp_request_flush();
}
