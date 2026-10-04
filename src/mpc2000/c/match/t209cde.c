#include "mpc2k.h"

void __far __fastcall __loadds X_0A0CA(void)
{
	if (!(*(long *)&SND_CURRENT)) goto X_0A115;
	win_keys_merge(P_3AE4 + 2);
	voice_release_all_if((*(long *)&SND_CURRENT));
	track_block_copy(TBL_SOUND_NAMES, (*(long *)&SND_CURRENT), 0x7a);
	FP_SND_SECONDARY = (*(long *)&SND_CURRENT);
	zone_edit_up();
X_0A115:
	;
}
