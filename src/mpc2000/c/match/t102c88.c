#pragma pack(1)
struct st { char pad[0x11]; unsigned char flag_11; char flag_12; char flag_13; char pad2[8]; long range; };
struct pe {
	struct st far *st;
	char pad[6];
	unsigned char b0a;
	unsigned char b0b;
	char c0c;
	int w0d;
	char c0f;
	char c10;
	char pad2[6];
	char c17;
	char c18;
	char c19;
	char pad3[2];
	char c1c;
};
struct vs {
	unsigned char f0, f1, f2, f3, f4, f5, f6, f7, f8, f9;
	char pad[0x0c];
	long a16, a1a, a1e;
	char rest[0x1a];
};
#pragma pack()

extern int TBL_09DA[1];
void __near __pascal mpc_ctrl_init(struct vs far *, struct st far *);
void __near __pascal voice_pitch_ratio(struct vs far *, int, int, int);
long __near __pascal mpc_status_read(struct vs far *, struct st far *, char);
void __near __pascal audio_mixing_handler(struct vs far *, struct pe far *);
int __near __pascal mpc_status_wait(struct vs far *, int, int);
void __near __pascal system_setup(struct vs far *, long, int, int);
void __near __pascal midi_parse_channel(struct vs far *, long, long);
void __far __pascal voice_start(struct vs far *, int, int, char);
void __far dma_status_rearm(void);

void __near __pascal note_voice_prepare(int p16, unsigned char far *q, struct pe far *pe, long a, long b, char c)
{
	struct vs v;
	long r;
	int w;
	struct st far *st;
	int idx;
	int n;
	char b1;
	unsigned char b2;
	long t;

	if ((st = pe->st) == 0)
		return;
	v.f1 = q[2];
	v.f2 = q[5];
	v.f3 = q[4];
	mpc_ctrl_init(&v, st);
	v.f5 = pe->b0a;
	voice_pitch_ratio(&v, st->flag_12, pe->w0d, pe->c1c);
	if ((r = mpc_status_read(&v, st, pe->c19)) <= 0)
		return;
	audio_mixing_handler(&v, pe);
	if (!mpc_status_wait(&v, st->flag_11, pe->c17))
		return;
	idx = q[4] == 2 ? q[5] : pe->c0f;
	w = TBL_09DA[(0x80 - q[2]) * pe->c18 / 0x7f] + TBL_09DA[idx];
	if (q[4] == 1) {
		n = idx = q[5];
		v.f6 = 1;
	} else {
		n = pe->c10;
		v.f6 = c;
	}
	n = TBL_09DA[n];
	system_setup(&v, r, w, n);
	midi_parse_channel(&v, a, b);
	if (st->flag_13) {
		b1 = v.f9;
		if (b1 > 0 && b1 < 9) {
			v.f9 = b1 = (b1 - 1 & 0xfe) + 1;
			b1++;
		}
		b2 = v.f7;
		v.f7 = 0;
		v.f0 = 0xff;
		voice_start(&v, p16, pe->b0b, pe->c0c);
		v.f9 = b1;
		v.f7 = b2;
		v.f8 = 0;
		t = st->range + 15 & ~15L;
		v.a16 += t;
		v.a1a += t;
		v.a1e += t;
		if (v.f5 == 1)
			v.f5 = 0;
	}
	v.f0 = 0xff;
	voice_start(&v, p16, pe->b0b, pe->c0c);
	dma_status_rearm();
}
