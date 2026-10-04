#include "mpc2k.h"

void __far __fastcall __loadds X_09B20(void)
{
	if (!(*(long *)&SND_CURRENT)) goto br_09B49;
	if (((int (__far __pascal *)(long))sample_check_active)((*(long *)&SND_CURRENT))) goto br_09B49;
	win_keys_merge(TBL_WINKEYS_FIT_TO_LENGTH);
br_09B49:
	;
}
