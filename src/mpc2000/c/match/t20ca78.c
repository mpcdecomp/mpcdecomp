#include "mpc2k.h"

long __far __pascal smem_block_skip(long p0)
{
	int l2;

	((void (__far __pascal *)(long, char __far *, int))smem_read_words)(p0 + 1L, &l2, 1);
	return (unsigned long)((unsigned)(l2 + 8) >> 1) + p0;
}
