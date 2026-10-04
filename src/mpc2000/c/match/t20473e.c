#include "mpc2k.h"

void __far __fastcall __loadds X_04888(void)
{
	int si_;

	si_ = TBL_151E[FXEDIT_CURSOR];
	if (channel_validate(G_STATE_9D8B)[70] != 1) goto X_048B9;
	si_ = TBL_1526[si_];
X_048B9:
	fx_type_load();
	((int (__far *)(void))((long *)((char *)TBL_152E))[si_])();
}
