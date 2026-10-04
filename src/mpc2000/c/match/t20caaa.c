#include "mpc2krec.h"
extern int G_ERRNO;
long __far __pascal int40_disk_wrapper(char __far *);
long __far __pascal smem_block_skip(long);
int __far __pascal midi_status_process(long, long);
void __far __pascal _memcpy_5(struct SND __far *, char __far *);
void __far __pascal smem_read_words(long, void __far *, int);
struct SND __far * __far __pascal sample_pool_add(struct SND);

/* a sound out of the flash: an 81h 04h block, its 40-byte header, then the samples */
struct SND __far * __far __pascal memcpy_far_handler(char __far *name)
{
	long a;
	int r;
	unsigned char h[2];
	long len;
	char rec[40];
	struct SND s;

	if (!(a = int40_disk_wrapper(name))) {
		G_ERRNO = ERR_CANT_OPEN;
		return 0;
	}
	smem_read_words(a, h, 1);
	if (h[0] != 0x81) goto bad;
	if (h[1] != 4) goto bad;
	smem_read_words(a + 2, rec, 20);
	_memcpy_5(&s, rec);
	a = smem_block_skip(a);
	smem_read_words(a - 2, &len, 2);
	if ((r = midi_status_process(a, len)) == -1) {
		G_ERRNO = ERR_INTERNAL;
		return 0;
	}
	s.pool_idx = r;
	return sample_pool_add(s);
bad:
	G_ERRNO = ERR_UNKNOWN_FILE_TYPE;
	return 0;
}
