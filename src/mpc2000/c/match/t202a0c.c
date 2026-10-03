#pragma pack(1)
struct snd {
	char name[0x11];
	unsigned char f11;
	char f12;
	unsigned char stereo;
	long start;
	long end;
	long length;
	long loop;
	char f24;
	char pad[0x0b];
	int pool_idx;
	long f32;
};
struct vs {
	unsigned char f0, f1, f2, f3, f4, f5, f6, f7, f8, f9, fa, fb;
	char pad[2];
	unsigned w0e;
	unsigned w10;
	unsigned w12;
	unsigned w14;
	long a16, a1a, a1e, a22, a26;
	unsigned w2a, w2c, w2e, w30;
	long a32;
	int w36, w38, w3a;
};
struct pool { long base; long len; int x; };
#pragma pack()

extern struct pool SMEM_POOL[64];
extern unsigned TBL_PITCH_RATIO[1];
void __far __pascal voice_start(struct vs far *, int, int, char);
void __far dma_status_rearm(void);

void __far __pascal voice_start_sample(struct snd far *s, long start, long end)
{
	struct vs v;
	long d;
	unsigned r;

	if (!s)
		return;
	d = (end - start) * 10 / 441 - 30;
	if (d <= 0)
		return;
	if (start > end)
		return;
	if (!(r = s->f11 * 230))
		return;
	r = ((long)r << 16) / 50801L;
	if (r > 0x7fff)
		r = 0x7fff;
	v.f0 = 0x15;
	v.a16 = SMEM_POOL[s->pool_idx].base + start;
	v.w0e = TBL_PITCH_RATIO[s->f12];
	v.w12 = v.w10 = r;
	v.a26 = 0x3fffffffL;
	v.w2e = v.w2a = 0x7ff0;
	v.w30 = v.w2c = 0;
	v.f8 = v.f7 = 0x80;
	v.f5 = 2;
	v.f6 = v.fb = v.f9 = v.f4 = 0;
	v.a32 = (d << 12) / (long)v.w0e;
	v.w3a = v.w38 = v.w36 = 0;
	v.w14 = 0xff00;
	if (s->stereo) {
		v.f7 = 0;
		voice_start(&v, 0x63, 0, 0);
		v.f0 = 0x17;
		v.f7 = 0x80;
		v.f8 = 0;
		d = s->length + 15 & ~15L;
		v.a16 += d;
		v.a1a += d;
		v.a1e += d;
	}
	voice_start(&v, 0x63, 0, 0);
	dma_status_rearm();
}
