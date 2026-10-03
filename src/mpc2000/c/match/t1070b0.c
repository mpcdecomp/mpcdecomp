#include "mpc2k.h"

void __near fn_07030(void)
{
	smem_write_sample();
	dac_out_program();
	REC_TRIG_PEAK = 0;
	((void (__far *)(void (__far *)(void)))callback_set_main)(L_07300);
}
