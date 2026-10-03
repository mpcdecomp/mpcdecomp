#include "mpc2k.h"

void __far __pascal smem_proc_wrapper(long p0)
{
	((void (__far __pascal *)(long, int, int))rep_memcpy_handler)(p0, 0, 0);
}
