#include "mpc2k.h"

int __far __pascal sample_check_active(struct SND __far *s)
{
	if (s && (SMEM_POOL[s->pool_idx].base & 0x1000000L)) return 1;
	return 0;
}
