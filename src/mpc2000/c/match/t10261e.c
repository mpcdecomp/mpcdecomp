#include "mpc2k.h"

int __far __pascal midi_status_process(long base, unsigned long len)
{
	struct SMEM_POOL e;
	int r;

	len += 0xf;
	len &= ~0xfL;
	e.base = base;
	e.len = len;
	return (r = smem_pool_insert(e)) == 0x82 ? -1 : r;
}
