#include "mpc2k.h"

void __near L_05074(void)
{
	voice_trigger_full(((char __far * (__near __pascal *)(int))track_calc_offset)(G_PAD_NOTE_BASE) + 5, 3, 0x26, 0x27, 7, timer_poll_wait_1);
}
