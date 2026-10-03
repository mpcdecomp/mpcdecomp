#include "mpc2k.h"

void __far __fastcall __loadds pgm_params_enter(void)
{
	G_NOTE_CAPTURE = 1;
	PAD_INPUT_MODE = 1;
	G_PGM_RETURN_PARAMS = 1;
	note_release_latched();
	win_keys_merge(((char *)P_2208));
	timer_dma_sync();
}
