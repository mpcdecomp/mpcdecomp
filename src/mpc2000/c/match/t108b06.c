#include "mpc2k.h"


int __far X_08A86(void)
{
	G_ERRNO = ERR_FILE_DAMAGED;
	if (int2F_call_fn6(B_8A0E, 0x190) != 0x190) goto X_08ADA;
	switch (main_handler_2()) { case 0: goto X_08ADA; }
	if (int2F_call_fn6(TBL_SOUND_NAMES, 0x880) == 0x880) {
		int2F_dispatch_10();
		lcd_cmd_wrapper(B_8A0E);
		program_select(PGM_SLOT);
		return sample_proc_wrapper();
	}
X_08ADA:
	int2F_dispatch_10();
	err_msg_report();
	return 0;
}
