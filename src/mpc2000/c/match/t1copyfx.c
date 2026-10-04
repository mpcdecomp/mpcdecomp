/* MPC2000 SYS text1: the COPY FX screen's cursor keys. */

#include "mpc2k.h"

void __far __loadds __fastcall copy_fx_up(void)
{
	if (COPY_FX_CURSOR != 0)
		COPY_FX_CURSOR--;
	fx_copy_arm_field();
}

void __far __loadds __fastcall copy_fx_down(void)
{
	if (COPY_FX_CURSOR < 3)
		COPY_FX_CURSOR++;
	fx_copy_arm_field();
}
