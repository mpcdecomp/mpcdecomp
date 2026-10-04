#include "mpc2k.h"

void __far __fastcall __loadds X_05BF6(void)
{
	if (VELO_MOD_CURSOR <= 0) goto X_05C07;
	VELO_MOD_CURSOR--;
X_05C07:
	velo_mod_arm_field();
}
