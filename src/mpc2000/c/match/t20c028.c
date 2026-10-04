#include "mpc2k.h"

int __far __pascal smem_block_alloc(int __far *slot, long a)
{
	*slot = -1;
	if (!mem_io_handler(slot, a, 0)) return 0;
	fn_0D9CE(1);
	if (!sample_data_load_12bit(SMEM_POOL[*slot].base, a)) {
		smem_free(*slot);
		return 0;
	}
	return 1;
}
