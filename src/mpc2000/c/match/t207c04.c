#include "mpc2k.h"

void __far __fastcall __loadds snd_window_pad_key(char k)
{
	if (k == 0) {
		if (SND_CURRENT->loopon != k)
			voice_release_all_if((long)SND_CURRENT);
		return;
	}
	lcd_set_cursor(SND_CURRENT);
}
