#include "mpc2k.h"

void __far __fastcall __loadds L_0733E(void)
{
	if (SAMPLE_TIME != 0) {
		if (P_9D40 != 0) {
			G_SAMPLE_MODE = SAMPLE_ST_ARMED;
			io_near_stub();
			if (SAMPLE_THRESHOLD < (char)0xc1) {
				fn_07030();
				fn_0704C();
				return;
			}
		} else {
			far_067A6();
			rec_arm_field();
		}
	} else {
		string_fill_stosb(STR_TIME_TOO_SHORT);
		REC_CURSOR = 4;
		rec_arm_field();
	}
}
