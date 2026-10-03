#include "mpc2k.h"

void __far __pascal sample_dispatch_table(int k)
{
	int c;

	c = PTR_TRACK_DATA[G_PAD_BANK * 16 + (unsigned char)G_PAD_INDEX];
	B_8D42 = k;
	switch (k) {
	case 1: B_8D43 = 1; break;
	case 2: B_8D43 = 2; break;
	case 3: B_8D43 = 5; break;
	case 4: B_8D43 = 6; break;
	case 5: B_8D43 = 3; break;
	case 6: B_8D43 = 4; break;
	}
	if ((unsigned)(c - 0x23) <= 0x3f) {
		G_PAD_NOTE_BASE = c;
		win_keys_merge(TBL_WINKEYS_CHANNEL_SETTINGS);
		timer_str_handler();
	}
}
