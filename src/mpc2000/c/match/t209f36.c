#include "mpc2k.h"

int __far range_seq_caller(void)
{
	char __far *m;
	int n;

	m = PTR_MIDI_STATE;
	if (int2F_call_fn6((char __far *)&n, 2) == 2
	    && ((int (__far __pascal *)(char __far *, int, int, int, int))range_process)(TBL_SOUND_NAMES, 1, n * 0x11, 1, 0x880)
	    && ((int (__far __pascal *)(char __far *))range_smem_setup)(m)) {
		int2F_dispatch_10();
		bcd_convert(m + 2, P_8F4E);
		program_select(B_8F5F);
		return ((int (__far *)(void))sample_process_1)();
	}
	int2F_dispatch_10();
	G_ERRNO = 4;
	err_msg_report();
	return 0;
}
