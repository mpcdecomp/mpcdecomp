#include "mpc2k.h"

char __far * __far __fstrcpy(char __far *, const char __far *);
#pragma intrinsic(_fstrcpy)
#define src ((struct SND __far *)from)

/* a new sound of src's samples start..end, copied into a pool block of its own */
int __near __pascal zone_action_new_sample(char __far *from, long start, long end, char __far *name)
{
	struct SND s;
	long len;

	len = end - start;
	sample_desc_init(&s);
	s.start = 0;
	s.end = s.length = len;
	*(long *)&s.field_32 = addr_calc_segment(s.loop, 0);
	s.stereo = src->stereo;
	_fstrcpy(s.name, name);
	if (!sample_access_caller(name, 1))
		return 0;
	if (!mem_io_handler(&s.pool_idx, len, (char)s.stereo))
		return 0;
	sample_pool_add(s);
	start += SMEM_POOL[src->pool_idx].base;
	smem_copy_buffered(start, SMEM_POOL[s.pool_idx].base, s.length);
	if (src->stereo) {
		start += src->length + 15 & ~15L;
		smem_copy_buffered(start, (s.length + 15 & ~15L) + SMEM_POOL[s.pool_idx].base, s.length);
	}
	return 1;
}
