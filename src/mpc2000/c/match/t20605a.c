#include "mpc2k.h"

void __far __fastcall __loadds copy_pgm_refresh(void)
{
	note_release_latched();
	voice_release_all();
	PAD_INPUT_MODE = PADIN_LOCAL;
	B_9D1C &= 0xfe;
	int44_wrapper(1);
}
