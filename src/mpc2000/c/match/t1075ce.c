#include "mpc2k.h"

void __far __fastcall __loadds L_0754E(void)
{
	cmd_exec_0E_wrapper(0);
	cmd_dispatch_1E(REC_INPUT_X, REC_INPUT_Y, SAMPLE_INPUT * 8 + TBL_REC_INPUT_LABELS);
	cmd_dispatch_1E(REC_MODE_X, REC_MODE_Y, G_REC_MODE * 7 + TBL_REC_MODE_LABELS);
	cmd_dispatch_1E(B_2E3A, B_2E3B, SAMPLE_MONITOR * 4 + TBL_OFF_ON_LABELS);
	if (SAMPLE_THRESHOLD < (char)0xc1) {
		cmd_dispatch_1E((*(unsigned char *)&REC_THRESH_X), REC_THRESH_Y, TBL_OFF_ON_LABELS);
	} else {
		((void (__far __pascal *)(int, char, long, int))draw_signed_value)((*(unsigned char *)&REC_THRESH_X), REC_THRESH_Y, (long)SAMPLE_THRESHOLD, 2);
	}
	((void (__far __pascal *)(int, char, int))timer_value_read_5)(REC_TIME_X, REC_TIME_Y, (*(int *)&SAMPLE_TIME));
	((void (__far __pascal *)(int, char, unsigned long, int))draw_unsigned_value)(B_2E40, B_2E41, (unsigned long)SAMPLE_PREREC, 3);
	field_redraw();
	io_write_caller();
}
