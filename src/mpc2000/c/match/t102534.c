#include "mpc2k.h"

void __near __pascal smem_pool_remove(int i)
{
	int j;

	if (SMEM_POOL_USED == i) SMEM_POOL_USED = SMEM_POOL[i].next;
	else {
		j = SMEM_POOL_USED;
		while (SMEM_POOL[j].next != i) {
			if (j >= 0x82) return;
			j = SMEM_POOL[j].next;
		}
		SMEM_POOL[j].next = SMEM_POOL[i].next;
	}
	SMEM_POOL[i].next = SMEM_POOL_FREE;
	SMEM_POOL_FREE = i;
}
