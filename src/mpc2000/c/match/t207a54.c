#include "mpc2k.h"

void __far __fastcall __loadds edit_range_select(void)
{
	long a;
	long b;

	if (!SND_CURRENT) return;
	if (W_3064) return;
	switch (PLAY_X_MODE) {
	case 0:
		a = 0;
		b = SND_CURRENT->length;
		break;
	case 1:
		a = G_ZONE_START;
		b = G_ZONE_END;
		break;
	case 2:
		a = 0;
		b = G_ZONE_START;
		break;
	case 3:
		a = G_ZONE_END;
		b = SND_CURRENT->length;
		break;
	case 4:
		a = 0;
		b = SND_CURRENT->start;
		break;
	case 5:
		a = SND_CURRENT->end;
		b = SND_CURRENT->length;
		break;
	default:
		return;
	}
	W_3064 = (long)SND_CURRENT;
	voice_start_sample(SND_CURRENT, a, b);
}
