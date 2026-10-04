#include "mpc2k.h"

long __far smem_alloc_top(void)
{
	long top;
	int i;

	top = 0;
	for (i = SMEM_POOL_USED; i != 0x82; i = SMEM_POOL[i].next)
		if (!(SMEM_POOL[i].base & 0x1000000L) && SMEM_POOL[i].len + SMEM_POOL[i].base > top)
			top = SMEM_POOL[i].len + SMEM_POOL[i].base;
	return top;
}
