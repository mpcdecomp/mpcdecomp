#include "mpc2kxl.h"

extern char C1_TBL_00A90[1];
extern char C1_W_00A26[1];

void __far far_446A4(void)
{
	handler_set_install(C1_W_00A26);
	if (C1_W_SAVE_PGM_CURSOR < 0) goto br_446BE;
	if ((unsigned)C1_W_SAVE_PGM_CURSOR < 2) goto br_446C4;
br_446BE:
	C1_W_SAVE_PGM_CURSOR = 0;
br_446C4:
	((int (__far *)(void))*(long *)(C1_TBL_00A90 + C1_W_SAVE_PGM_CURSOR * 42))();
}
