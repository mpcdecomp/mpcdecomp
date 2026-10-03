#include "mpc2k.h"

void __far __fastcall __loadds snd_window_refresh_key(void)
{
	voice_release_all();
	int44_wrapper(1);
}
