#include "mpc2k.h"

typedef char __far * __near *PT;

void __far smem_transfer_io(void)
{
	int i, j;

	for (i = 0; i < 0x18; i++)
		if (*(unsigned __far *)((PT)PGM_TABLE)[i] > 2)
			for (j = 0; j < 0x40; j++)
				*(long __far *)(((PT)PGM_TABLE)[i] + j * 0x1d + 0x1e) = 0;
}
