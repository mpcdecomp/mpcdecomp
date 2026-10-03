#include "mpc2k.h"

int __far far_0A6FA(void)
{
	if (int2F_call_fn6(TBL_SOUND_NAMES, 0x880) != 0x880) goto br_0A772;
	if (int2F_call_fn6(P_9842, 0x200) != 0x200) goto br_0A772;
	if (int2F_call_fn6(P_64DA, 0x77e) == 0x77e) {
		int2F_dispatch_10();
		lcd_buffer_copy(PTR_MIDI_STATE, P_64DA);
		bcd_convert(PTR_MIDI_STATE + 2, P_8F4E);
		program_select(B_8F5F);
		return sample_process_1();
	}
br_0A772:
	int2F_dispatch_10();
	G_ERRNO = 4;
	err_msg_report();
	return 0;
}
