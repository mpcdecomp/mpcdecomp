#include "mpc2k.h"

extern char ERR_FILE_DAMAGED[1];

int __far X_08B84(void)
{
	G_ERRNO = ERR_FILE_DAMAGED;
	if (int2F_call_fn6(B_8A0E, 0x141) != 0x141) goto X_08BDC;
	switch (tgt_08BEA()) { case 0: goto X_08BDC; }
	if (int2F_call_fn6(TBL_SOUND_NAMES, 0x880) == 0x880) {
		int2F_dispatch_10();
		lcd_line_clear(B_9D5A, B_8A0E);
		program_select(PGM_SLOT);
		return sample_proc_wrapper();
	}
X_08BDC:
	int2F_dispatch_10();
	err_msg_report();
	return 0;
}
