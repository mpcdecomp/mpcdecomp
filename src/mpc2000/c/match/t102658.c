#include "mpc2k.h"

void __far __pascal smem_free(int p0)
{
	smem_pool_remove(p0);
}
