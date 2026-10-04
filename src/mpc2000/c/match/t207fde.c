#include "mpc2k.h"

void __far sample_name_search(void)
{
	int n;
	long q;

	if (G_WAVE_VALID && G_WAVE_COLS_DONE < 0xf5) {
		q = (*(long *)&G_WAVE_SMEM_END - *(long *)G_WAVE_SMEM_START) / (long)(0xf5 - G_WAVE_COLS_DONE);
		if (q >= 0xf5) n = 1;
		else n = 0xf5 - (int)q;
		while (n--) string_func_handler();
		cmd_far_stub2();
	}
}
