#include "mpc2k.h"

int __near __pascal track_event_handler(long len)
{
	int slot;
	long sz;
	long half;
	long base;

	half = len / 2;
	if (!mem_io_handler(&slot, half, 0)) _longjmp(P_9D8E, G_ERRNO);
	base = SMEM_POOL[slot].base;
	sz = SMEM_POOL[slot].len;
	smem_free(slot);
	if (far_memop_caller(base, half) != half) _longjmp(P_9D8E, G_ERRNO);
	slot = smem_alloc(sz);
	if (slot == -1 || SMEM_POOL[slot].base != base) {
		if (slot != -1) smem_free(slot);
		_longjmp(P_9D8E, 5);
	}
	return slot;
}
