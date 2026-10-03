#include "mpc2k.h"

void __far __pascal ui_enter_pad_assign(long p0)
{
	disp_list_run(P_3E48);
	(*(unsigned char *)&G_NOTE_CAPTURE) = 1;
	PAD_INPUT_MODE = 1;
	win_keys_merge(P_3E20);
	(*(long *)&FP_LOADED_SND) = p0;
	timer_value_read_1(G_NOTE_IN, 0x83, 0x27, 1);
}
