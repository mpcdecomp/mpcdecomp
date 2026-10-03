#include "mpc2k.h"

void __far __fastcall __loadds L_05EFA(void)
{
	note_release_latched();
	voice_release_all();
	PAD_INPUT_MODE = 2;
	B_9D1C &= 0xfe;
}
