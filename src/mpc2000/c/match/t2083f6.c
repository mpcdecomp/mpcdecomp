#include "mpc2k.h"

void __far __fastcall __loadds tgt_087D4(void)
{
	if (!(*(long *)&SND_CURRENT)) goto br_0881B;
	voice_release_all_if((*(long *)&SND_CURRENT));
	win_keys_merge(TBL_WINKEYS_031BE);
	if (((int (__far __pascal *)(long))sample_check_active)((*(long *)&SND_CURRENT))) goto br_0881B;
	((void (__far __pascal *)(long, int, int))far_call_wrapper_1)((*(long *)&SND_CURRENT), 0x67, 0xd);
br_0881B:
	;
}
