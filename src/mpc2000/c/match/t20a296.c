#include "mpc2k.h"

int __far far_0A682(void)
{
	if (int2F_call_fn6(TBL_SOUND_NAMES, 0x880) != 0x880) goto br_0A6E6;
	if (int2F_call_fn6(P_64DA, 0x79b) == 0x79b) {
		int2F_dispatch_10();
		lcd_region_copy(PTR_MIDI_STATE, P_64DA);
		bcd_convert(PTR_MIDI_STATE + 2, P_8F4E);
		program_select(B_8F5F);
		return sample_process_1();
	}
br_0A6E6:
	int2F_dispatch_10();
	G_ERRNO = ERR_FILE_DAMAGED;
	err_msg_report();
	return 0;
}
