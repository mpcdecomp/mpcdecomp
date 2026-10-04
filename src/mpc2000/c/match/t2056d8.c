#include "mpc2k.h"

#pragma intrinsic(memcpy)

void __far L_05844(void)
{
	far_memop_str_1(P_9DA0);
	memcpy(P_8F78, P_1D76, 0x40);
	MIDI_VOLUME_VAL = 0x7f;
	(*(int *)&SAMPLE_TIME) = 0xa;
	SAMPLE_THRESHOLD = 0xec;
	(*(char *)&SAMPLE_PREREC) = 0xa;
	B_9D77 = 0;
	SAMPLE_INPUT = 0;
	G_REC_MODE = REC_MODE_MONO_L;
	PLAY_X_MODE = 0;
	ZONE_EDIT_ACTION = 0;
	TRIM_LEN_FIX[0] = 0;
	LOOP_LEN_FIX[0] = 0;
	ZONE_LEN_FIX = 0;
	SND_EDIT_VIEW = 0;
	SAMPLE_MONITOR = 1;
	MIDI_VOLUME_RX = 1;
	PGM_CHANGE_RX = 1;
	MIDI_LOCAL_MODE = 1;
	cmd_exec_1E_ext(0);
}
