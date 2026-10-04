#include "mpc2k.h"

long __far X_00E76(void)
{
	return SMEM_SIZE - smem_alloc_top();
}
