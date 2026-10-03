/* MPC2000 SYS text1: the FX edit screen's cursor keys. */

#include "mpc2k.h"

void __far __loadds __fastcall X_03896(void)
{
	if (FXEDIT_CURSOR >= 2) {
		if (FXEDIT_CURSOR < 5)
			FXEDIT_CURSOR = 0;
		else
			FXEDIT_CURSOR = 1;
		fn_03836();
	}
}

void __far __loadds __fastcall X_038BA(void)
{
	if (FXEDIT_CURSOR <= 1) {
		FXEDIT_CURSOR = FXEDIT_CURSOR ? 7 : 2;
		fn_03836();
	}
}

void __far __loadds __fastcall X_038D6(void)
{
	if (FXEDIT_CURSOR > 0) {
		FXEDIT_CURSOR--;
		fn_03836();
	}
}

void __far __loadds __fastcall X_038EC(void)
{
	if (FXEDIT_CURSOR < 7) {
		FXEDIT_CURSOR++;
		fn_03836();
	}
}
