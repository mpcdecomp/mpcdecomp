#include "mpc2k.h"

void __near copy_program_arm_field(void)
{
	if (!COPY_PGM_CURSOR) {
		far_call_wrapper_1(TBL_SOUND_NAMES, 0x7f, 0x13);
		return;
	}
	((void (__far __pascal *)(char __far *, int, int, int, int, int, int, int, int, int))timer_dma_ch2)(COPY_PGM_TO, 0, 0x7f, 3, 0xc1, 0x25, 0, 0, 0, 0);
	far_02DD2();
	X_02D4A();
}
