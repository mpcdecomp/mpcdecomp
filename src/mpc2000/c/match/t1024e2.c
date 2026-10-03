#include "mpc2k.h"

int __near __pascal smem_pool_insert(struct SMEM_POOL e)
{
	int i;

	i = SMEM_POOL_FREE;
	SMEM_POOL_FREE = SMEM_POOL[i].next;
	SMEM_POOL[i] = e;
	SMEM_POOL[i].next = SMEM_POOL_USED;
	SMEM_POOL_USED = i;
	return i;
}
