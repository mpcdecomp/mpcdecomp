/* MPC2000 SYS text1: the FX edit screen's second page: cursor keys and entry. */

#include "mpc2k.h"

void __far __loadds __fastcall X_03796(void)
{
	if (FXEDIT_CURSOR >= 2) {
		if (FXEDIT_CURSOR == 2)
			FXEDIT_CURSOR = 0;
		else
			FXEDIT_CURSOR = 1;
		fn_03724();
	}
}

void __far __loadds __fastcall X_037B6(void)
{
	if (FXEDIT_CURSOR <= 1) {
		FXEDIT_CURSOR = FXEDIT_CURSOR ? 4 : 2;
		fn_03724();
	}
}

void __far __loadds __fastcall X_037D2(void)
{
	if (FXEDIT_CURSOR > 0) {
		FXEDIT_CURSOR--;
		fn_03724();
	}
}

void __far __loadds __fastcall X_037E8(void)
{
	if (FXEDIT_CURSOR < 4) {
		FXEDIT_CURSOR++;
		fn_03724();
	}
}

/* The key table's second half follows the channel's effect type. */
void far X_037FE(void)
{
	char far *ch = channel_validate(G_STATE_9D8B);

	*(void far * __near *)(P_148A + 1) = TBL_14B8[ch[0x46]];
	((void (__far __pascal *)(void __far *))win_keys_merge)(P_148A);
	fn_03836();
}
