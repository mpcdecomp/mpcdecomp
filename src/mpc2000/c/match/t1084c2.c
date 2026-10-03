#pragma pack(1)
struct snd {
	char name[0x13];
	char stereo;
	long start;
	long end;
	long length;
	long loop;
	char pad[0x0c];
	int pool_idx;
	long f32;
};
struct pool { long base; long len; int x; };
#pragma pack()

extern struct pool SMEM_POOL[64];
void __far __pascal input_handler(long, long, long);
long __far addr_calc_segment(long, int);
void __far smem_compact(void);

int __near __pascal zone_action_delete(struct snd far *s, long st, long e)
{
	long base;
	long al2;
	long al1;
	long len;
	long nl;
	long tail;
	long n2;

	len = s->length;
	tail = len - e;
	n2 = nl = tail + st;
	base = SMEM_POOL[s->pool_idx].base;
	al1 = len + 15 & ~15L;
	al2 = n2 + 15 & ~15L;
	input_handler(base + e, base + st, tail);
	if (s->stereo) {
		input_handler(base + al1, base + al2, st);
		input_handler(base + al1 + e, base + al2 + st, len - e);
	}
	SMEM_POOL[s->pool_idx].len = al2 * (s->stereo + 1);
	s->length = nl;
	if (s->end > e)
		s->end += st - e;
	else if (s->end > st)
		s->end = st;
	if (s->start > e)
		s->start += st - e;
	else if (s->start > st)
		s->start = st;
	if (s->end < s->loop)
		s->f32 = addr_calc_segment(s->loop = s->end, 0);
	smem_compact();
	return 1;
}
