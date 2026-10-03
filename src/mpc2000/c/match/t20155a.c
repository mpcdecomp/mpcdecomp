#include "mpc2k.h"

void __far __pascal string_memop_setup(long p0)
{
	int l2;
	char l6[4];

	mem_op_handler(p0, &l2);
	*(int *)l6 = 0x20;
	*(int *)(l6 + 2) = 0xd0;
	((void (__far __pascal *)(long, char __far *, int))flash_write_words)(p0, l6, 2);
	io_delay_wait2(p0);
}
