#include "mpc2kxl.h"

extern char C2_TBL_03BF4[1];

void __far L_4FC3C(void)
{
	((int (__far *)(void))*(long *)(C2_TBL_03BF4 + C2_W_VELO_PITCH_CURSOR * 42))();
	disp_request_flush();
}
