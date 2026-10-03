#include "mpc2k.h"

void __far __fastcall __loadds delete_pgm_do_it(void)
{
	int i;

	smem_dma_init(PGM_SLOT);
	for (i = 0; i < 0x18; i++)
		if (*((int __far **)PGM_TABLE)[i] != 2) {
			program_select(i);
			program_close();
			return;
		}
	program_select_wrapper(0);
	program_select(0);
	program_close();
}
