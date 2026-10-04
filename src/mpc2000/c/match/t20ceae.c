#include "mpc2k.h"

void __far string_far_access(void)
{
	int l2;
	int si_;

	win_keys_merge(TBL_WINKEYS_MONO_TO_STEREO);
	si_ = 0;
loop_0D386:
	*(char *)&l2 = ((char __far *)SND_CURRENT)[si_];
	if (*(char *)&l2 == 0x20) {
		TBL_SOUND_NAMES[si_] = 0x5f;
	} else {
		TBL_SOUND_NAMES[si_] = *(char *)&l2;
	}
	si_++;
	if (si_ < 0xe) goto loop_0D386;
	B_8FCA = 0x2d;
	B_8FCB = 0x53;
	B_8FCC = 0;
	FP_SND_SECONDARY = ((char __far *)SND_CURRENT);
	mono_to_stereo_up();
}
