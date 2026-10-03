#include "mpc2k.h"

void __far X_05972(void)
{
	int si_;

	si_ = 0;
loop_05975:
	smem_dma_init(si_);
	si_++;
	if (si_ < 0x18) goto loop_05975;
	program_select_wrapper(0);
	program_select(0);
}
