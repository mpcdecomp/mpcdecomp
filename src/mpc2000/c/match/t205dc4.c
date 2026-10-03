#include "mpc2k.h"

void __far __fastcall __loadds pgm_midi_refresh(void)
{
	voice_release_all();
	PAD_INPUT_MODE = 2;
	B_9D1C &= 0xfe;
}
