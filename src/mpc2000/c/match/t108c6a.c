#include "mpc2k.h"

int __near tgt_08BEA(void)
{
	int i;

	for (i = 0; i < B_8A0E[0]; i++) {
		if (int2F_call_fn6(P_64DA, 0x77e) != 0x77e) {
			G_ERRNO = 4;
			return 0;
		}
		if (!program_select_wrapper(i)) {
			G_ERRNO = 1;
			return 0;
		}
		lcd_buffer_copy(((char __far * __near *)PGM_TABLE)[i], P_64DA);
	}
	return 1;
}
