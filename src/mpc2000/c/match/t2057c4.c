#include "mpc2k.h"

int __far __pascal program_select_wrapper(int p0)
{
	if (((unsigned (__far __pascal *)(int))int38_call_9e)(p0) == -1) return 0;
	smem_io_helper();
	far_memop_handler_1(p0);
	return 1;
}
