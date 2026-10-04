#include "mpc2k.h"

void __far __fastcall __loadds L_04588(void)
{
	int si_;

	si_ = TBL_1474[FXEDIT_CURSOR];
	fx_type_load();
	((int (__far *)(void))((long *)((char *)TBL_147A))[si_])();
}
