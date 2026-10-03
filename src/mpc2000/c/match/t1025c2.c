#include "mpc2k.h"

int __far __pascal smem_alloc(unsigned long len)
{
	struct SMEM_POOL e;
	int r;

	len += 0xf;
	e.base = smem_alloc_top();
	len &= ~0xfL;
	e.len = len;
	if (e.base + e.len > SMEM_SIZE) return -1;
	if ((r = smem_pool_insert(e)) == 0x82) return -1;
	return r;
}
