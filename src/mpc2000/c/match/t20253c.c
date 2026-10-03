#pragma pack(1)
struct vreq {
	unsigned char voice;
	char r1[3];
	char f4, f5, f6;
	char r7[0x14 - 7];
	int w14;
	char r16[0x2c - 0x16];
	int w2c;
	int w2e;
	int w30;
	unsigned long l32;
	unsigned w36;
	unsigned w38;
	unsigned w3a;
};
struct voice {
	unsigned char note;
	char f1, f2, f3;
	unsigned w4, w6, w8, wa;
	int wc, we, w10;
};
#pragma pack()

extern int TBL_574E[32], VOICE_TIMER[32], VOICE_HOLD[32], TBL_578E[32];
extern struct voice VOICE_TABLE[32];
void __far __pascal voice_release_by_note(int);
int __far __pascal voice_alloc(int);
void __far __pascal voice_regs_program(struct vreq far *);

void __far __pascal voice_start(struct vreq far *p, int note, int alt1, int alt2)
{
	struct voice r;

	r.f3 = p->f4;
	r.wa = p->w3a / 10 + 2;
	r.w10 = p->w2e;
	r.we = p->w30;
	r.wc = p->w14;
	r.f1 = p->f5;
	r.f2 = p->f6;
	r.w8 = 2;
	if (r.f2 == 1) {
		r.w6 = (p->w36 + 5) / 10;
		r.w4 = ((long)p->w36 + p->w38 + 5) / 10;
		if (r.w6 <= 1)
			r.w6 = 2;
		if (!r.w4)
			r.w4 = 1;
	} else if (p->f4) {
		r.w8 = (p->w38 + 5) / 10;
		if (r.w8 <= 1)
			r.w8 = 2;
		r.w6 = r.w4 = 0xffff;
		r.f1 = 2;
	} else {
		r.w6 = (p->l32 - p->w38 + 5) / 10;
		r.w4 = (p->l32 + 5) / 10;
		if (r.w6 <= 1)
			r.w6 = 2;
		if (!r.w4)
			r.w4 = 1;
	}
	if (r.f1 == 1)
		voice_release_by_note(note);
	if ((unsigned)(alt1 - 0x23) <= 0x3f)
		voice_release_by_note(alt1);
	if ((unsigned)(alt2 - 0x23) <= 0x3f)
		voice_release_by_note(alt2);
	if (p->voice >= 0x20)
		p->voice = voice_alloc(note);
	TBL_578E[p->voice] = 0;
	TBL_574E[p->voice] = TBL_578E[p->voice];
	VOICE_TIMER[p->voice] = TBL_574E[p->voice];
	VOICE_HOLD[p->voice] = VOICE_TIMER[p->voice];
	voice_regs_program(p);
	VOICE_TABLE[p->voice] = r;
	VOICE_TABLE[p->voice].note = note;
	VOICE_HOLD[p->voice] = r.w6;
	VOICE_TIMER[p->voice] = r.w4;
	if (p->w2c)
		TBL_574E[p->voice] = r.wa;
}
