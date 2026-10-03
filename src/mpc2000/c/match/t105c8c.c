#include "mpc2k.h"

void __far __fastcall __loadds X_05C0C(void)
{
	if (VELO_MOD_CURSOR >= 4) goto br_05C1D;
	VELO_MOD_CURSOR++;
br_05C1D:
	velo_mod_arm_field();
}
