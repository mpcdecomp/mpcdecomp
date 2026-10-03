#include "mpc2kxl.h"

extern char C1_TBL_00BE6[1];
extern char C1_W_00B7C[1];

void __far far_44E40(void)
{
	handler_set_install(C1_W_00B7C);
	if (C1_W_SAVE_APS_CURSOR < 0) goto br_44E5A;
	if ((unsigned)C1_W_SAVE_APS_CURSOR < 3) goto br_44E60;
br_44E5A:
	C1_W_SAVE_APS_CURSOR = 0;
br_44E60:
	((int (__far *)(void))*(long *)(C1_TBL_00BE6 + C1_W_SAVE_APS_CURSOR * 42))();
}
