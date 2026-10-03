#include "mpc2k.h"

void __far __fastcall __loadds purge_midi(void)
{
	note_release_latched();
	PAD_INPUT_MODE = 2;
	win_keys_merge(((char *)TBL_WINKEYS_PGM_MIDI));
	B_4FE4 = MIDI_VOLUME_VAL;
	program_arm_field();
}
