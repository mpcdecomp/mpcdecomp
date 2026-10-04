#include "mpc2k.h"

void __far __pascal program_select(int n)
{
	if (!P_1DBF) {
		P_1DBF = 1;
		if (**((unsigned __far * __near *)PGM_TABLE + n) > 2) {
			PGM_SLOT = n;
			PGM_CURRENT = ((struct PGM __far * __near *)PGM_TABLE)[n];
			PTR_TRACK_DATA = B_9D77 ? (char __far *)P_8F78 : (char __far *)PGM_CURRENT + 0x8de;
			seq_select_setup_1((long)PTR_TRACK_DATA);
			seq_select_setup_2((long)PGM_CURRENT);
			cmd_far_stub2();
			pending_ops_set(0xf);
		} else {
			G_ERRNO = ERR_INTERNAL;
			err_msg_report();
		}
		P_1DBF = 0;
	}
}
