#include "mpc2kxl.h"

extern char C2_SEG[1];
extern char P_4E74[1];
extern char P_57F6[1];

void __far far_537C4(void)
{
	handler_set_install(P_4E74);
	C2_W_PARAM_HOOK_OFF = P_57F6;
	C2_W_PARAM_HOOK_SEG = C2_SEG;
	if (C2_W_FX_MOD_CURSOR < 0) goto L_52E8A;
	if ((unsigned)C2_W_FX_MOD_CURSOR < 7) goto br_537F0;
L_52E8A:
	C2_W_FX_MOD_CURSOR = 0;
br_537F0:
	((int (__far *)(void))*(long *)(((char *)&C2_W_04F20) + C2_W_FX_MOD_CURSOR * 42))();
}
