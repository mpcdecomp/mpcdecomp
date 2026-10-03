#include "mpc2k.h"

void __far __fastcall __loadds L_03C30(void)
{
	win_keys_merge(TBL_WINKEYS_DEV_CREDITS);
	CREDITS_SCROLL_TICK = int38_wrapper();
	(*(int *)&CREDITS_SCROLL_LINE) = 0;
	(*(int *)&CREDITS_SCROLL_PHASE) = 9;
	return CREDITS_SCROLL_TICK;
}
