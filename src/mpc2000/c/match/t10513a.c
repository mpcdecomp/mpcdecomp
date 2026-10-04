#include "mpc2k.h"

void __near L_050BA_1(void)
{
	status_read_6A_3(((char __far * (__near __pascal *)(int))track_calc_offset)(G_PAD_NOTE_BASE) + 6, 0, 0x7e, 3, 0x92, 0x1e, 0L, pad_sw2_clamp);
}
