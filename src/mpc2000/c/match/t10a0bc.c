char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(strcpy)

#pragma pack(1)
struct hdr {
	char r0[0x11];
	unsigned w11;
	char r13[2];
	unsigned w15;
	char r17[2];
	unsigned w19;
	unsigned char b1b;
	char r1c[8];
	unsigned char mode;
	char r25[7];
	unsigned char rate;
};
struct snd_desc {
	char name[0x11];
	char level;
	char tune;
	char stereo;
	long start;
	long end;
	long len;
	long loop;
	char loopon;
	char r25;
	unsigned rate;
	char r28[0x0a];
	long seg;
	char r36[0];
};
struct req { char b[0x3c]; };
#pragma pack()

void __far __pascal sample_desc_init(struct snd_desc far *);
char far * __far __pascal sample_pool_add(struct snd_desc);
long __far addr_calc_segment(long, int);
extern int G_ERRNO;
extern char P_9D42[1];
int __far _setjmp(char far *);
void __far _longjmp(char far *, int);
void __far int2F_dispatch_10(void);
void __far err_msg_report(void);
int __far __pascal sample_access_caller(long, int);
void __near __pascal status_poll_handler2(struct req far *);
int __near __pascal smem_access_setup(struct req far *);
char far * __near __pascal voice_play_range(long, struct req far *);
void __far __pascal ui_enter_pad_assign(char far *);

void __near __pascal lcd_clear_line(char far *name, struct hdr far *h, long n)
{
	unsigned rates[4];
	char tunes[4];
	struct snd_desc d;

	rates[0] = 48000;
	rates[1] = 44100;
	rates[2] = 24000;
	rates[3] = 22050;
	tunes[0] = 0x0f;
	tunes[1] = 0;
	tunes[2] = 0x95;
	tunes[3] = 0x88;
	sample_desc_init(&d);
	strcpy(d.name, name);
	d.start = h->w11;
	d.len = n / 2;
	d.end = (((long)h->b1b << 16) | h->w19) + 1;
	d.loopon = h->mode >= 2 ? 0 : 1;
	d.loop = d.end - h->w15;
	d.seg = addr_calc_segment(d.loop, 0);
	if (h->rate <= 3) {
		d.rate = rates[h->rate];
		d.tune = tunes[h->rate];
	}
	sample_pool_add(d);
}

int __far smem_access_handler_1(long x)
{
	struct req r;
	int h;
	char far *p;
	int err;

	p = 0;
	h = -1;
	if (!(err = _setjmp(P_9D42))) {
		if (!sample_access_caller(x, 0))
			_longjmp(P_9D42, G_ERRNO);
		status_poll_handler2(&r);
		h = smem_access_setup(&r);
		p = voice_play_range(x, &r);
		*(int far *)(p + 0x30) = h;
		int2F_dispatch_10();
		ui_enter_pad_assign(p);
		return 1;
	}
	int2F_dispatch_10();
	G_ERRNO = err;
	err_msg_report();
	return 0;
}
