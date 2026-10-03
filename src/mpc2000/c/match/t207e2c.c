#include "mpc2k.h"

struct s1 {
	int f_0;
	int f_2;
};

void __far cmd_ratio_calc(void)
{
	int lo;
	int hi;
	int i;

	cmd_exec_0E_wrapper(1);
	cmd_build_params(19, 1, 21, 245, 27);
	if (G_WAVE_VALID != 0) {
		for (i = 0; i < 245; i++) {
			hi = ((struct s1 *)TBL_WAVE_NEG_PEAK)[i].f_2 / 0x97b;
			lo = ((struct s1 *)TBL_WAVE_NEG_PEAK)[i].f_0 / 0x97b;
			if (lo != 0) lo--;
			cmd_dispatch_0E(i + 1, 34 - hi, hi - lo);
		}
	}
	cmd_exec_0E_wrapper(0);
}
