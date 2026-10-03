#include "mpc2k.h"

struct smem {
	long base;
	long len;
	int pad;
};
struct samp {
	char a[0x13];
	signed char stereo;
	char b[8];
	long len;
	char c[0x10];
	int pool_idx;
	char d[4];
};

long __near __pascal lcd_clear_area(char __far *p, int b, int a)
{
	struct samp s;
	long base;
	long pos;
	char __far *h;
	char save;
	int pair;
	pair = 0;
	h = BUF_XFER;
	if ((p[10] == '-') && ((p[11] == 'L') || (p[11] == 'R'))) {
		save = p[11];
		pair = 1;
		p[11] = (save == 'L') ? ('R') : ('L');
		if (int2F_call_fn14(p) == (-1)) {
			pair = 0;
		}
		p[11] = save;
	}
	if (pair) {
		p[11] = 'L';
		if (!mem_block_process(p, 1)) {
			return 0;
		}
		if (!((int (__near __pascal *)(char __far *, int))lcd_area_setup)(h, b)) {
			goto fail;
		}
		h[0xd] = (h[0xe] = 10);
		if (!sample_access_caller(((long (__near __pascal *)(struct samp __far *, char __far *))lcd_clear_screen)(&s, h), a)) {
			goto fail;
		}
		if (!mem_io_handler(&s.pool_idx, s.len, s.stereo = 1)) {
			goto fail;
		}
		smem_free(s.pool_idx);
		base = ((struct smem *)SMEM_POOL)[s.pool_idx].base;
		if (far_memop_caller(base, s.len) != s.len) {
			G_ERRNO = 4;
			goto fail;
		}
		int2F_dispatch_10();
		p[11] = 'R';
		if (!mem_block_process(p, 1)) {
			do {
			} while (0);
			return 0;
		}
		if (!((int (__near __pascal *)(char __far *, int))lcd_area_setup)(h, b)) {
			goto fail;
		}
		pos = *((long __far *) (h + 0x1a));
		if (far_memop_caller((((struct smem *)SMEM_POOL)[s.pool_idx].len / 2) + base, pos) == (-1L)) {
			goto fail;
		}
		if (pos < s.len) {
			smem_fill(((((struct smem *)SMEM_POOL)[s.pool_idx].len / 2) + pos) + base, 0, s.len - pos);
		}
		s.pool_idx = smem_alloc(((struct smem *)SMEM_POOL)[s.pool_idx].len);
		if ((s.pool_idx == (-1)) || (((struct smem *)SMEM_POOL)[s.pool_idx].base != base)) {
			G_ERRNO = 5;
			smem_free(s.pool_idx);
			goto fail;
		}
		int2F_dispatch_10();
		return ((long (__far __pascal *)(struct samp))sample_pool_add)(s);
	} else
	{
		if (!mem_block_process(p, 1)) {
			return 0;
		}
		if (!((int (__near __pascal *)(char __far *, int))lcd_area_setup)(h, b)) {
			goto fail;
		}
		if (!sample_access_caller(((long (__near __pascal *)(struct samp __far *, char __far *))lcd_clear_screen)(&s, h), a)) {
			goto fail;
		}
		if ((s.pool_idx = midi_calc_timing(s.len, s.stereo)) == (-1)) {
			goto fail;
		}
	}
	int2F_dispatch_10();
	return ((long (__far __pascal *)(struct samp))sample_pool_add)(s);
	fail:
	int2F_dispatch_10();

	return 0;
}
