struct pool { long base; long len; int next; };
struct snd {
	char name[0x13];
	char stereo;
	long start;
	long end;
	long length;
	char pad[0x10];
	int pool_idx;
	char tail[4];
};
extern struct pool SMEM_POOL[64];
int __far __pascal mem_io_handler(int far *, long, int);
void __far __pascal smem_copy_buffered(long, long, long);
void __far __pascal smem_free(int);
void __far smem_compact(void);

int __near __pascal zone_action_insert_start(struct snd far *dst, long pos, struct snd far *src)
{
	struct snd tmp;
	long half;

	tmp = *dst;
	if (!mem_io_handler(&tmp.pool_idx, src->length + dst->length, dst->stereo)) return 0;
	smem_copy_buffered(SMEM_POOL[dst->pool_idx].base, SMEM_POOL[tmp.pool_idx].base, pos);
	smem_copy_buffered(SMEM_POOL[src->pool_idx].base, SMEM_POOL[tmp.pool_idx].base + pos, src->length);
	smem_copy_buffered(SMEM_POOL[dst->pool_idx].base + pos, SMEM_POOL[tmp.pool_idx].base + src->length + pos, dst->length - pos);
	if (dst->stereo) {
		half = SMEM_POOL[tmp.pool_idx].len / 2;
		smem_copy_buffered(SMEM_POOL[dst->pool_idx].base + SMEM_POOL[dst->pool_idx].len / 2, SMEM_POOL[tmp.pool_idx].base + half, pos);
		if (src->stereo)
			smem_copy_buffered(SMEM_POOL[src->pool_idx].base + SMEM_POOL[src->pool_idx].len / 2, SMEM_POOL[tmp.pool_idx].base + half + pos, src->length);
		else
			smem_copy_buffered(SMEM_POOL[src->pool_idx].base, SMEM_POOL[tmp.pool_idx].base + half + pos, src->length);
		smem_copy_buffered(SMEM_POOL[dst->pool_idx].base + SMEM_POOL[dst->pool_idx].len / 2 + pos, SMEM_POOL[tmp.pool_idx].base + src->length + half + pos, dst->length - pos);
	}
	smem_free(dst->pool_idx);
	tmp.length = dst->length + src->length;
	if (tmp.start > pos) tmp.start += src->length;
	if (tmp.end > pos) tmp.end += src->length;
	*dst = tmp;
	smem_compact();
	return 1;
}
