#include "mpc2k.h"

char __far * __far __fstrcpy(char __far *, const char __far *);
#pragma intrinsic(_fstrcpy)

/* src's sound copied under a new name, its sample data into a new pool block */
struct SND __far * __far __pascal sample_ptr_accessor(char __far *name, struct SND __far *src)
{
	struct SND s;
	int pool;

	if (sample_ptr_access(name)) {
		G_ERRNO = ERR_NAME_IN_USE;
		return 0;
	}
	if (!sample_caller_setup()) {
		G_ERRNO = ERR_SOUND_DIR_FULL;
		return 0;
	}
	pool = smem_alloc(SMEM_POOL[src->pool_idx].len);
	if (pool == -1) {
		G_ERRNO = ERR_NO_MEMORY;
		return 0;
	}
	smem_copy_buffered(SMEM_POOL[src->pool_idx].base, SMEM_POOL[pool].base, SMEM_POOL[src->pool_idx].len);
	s = *src;
	_fstrcpy(s.name, name);
	s.pool_idx = pool;
	return sample_pool_add(s);
}
