/* differs: 150 size 786, image 790; +20D image `mov si, word ptr [bp - 8]` CL `les bx, ptr [bp - 0xc]`; 172 size 786, image 790; +20D image `mov si, word ptr [bp - 8]` CL `les bx, ptr [bp - 0xc]` */
char * __cdecl strcpy(char *, const char *);
char * __cdecl strcat(char *, const char *);
#pragma intrinsic(strcpy, strcat)

#pragma pack(1)
struct note {
	char far *snd;
	char f4, mode, sw1, alt1, sw2, alt2, voice, mute1, mute2;
	int tune;
	char attack, decay, dcy_mode, flt_freq, flt_res, fenv_attack, fenv_decay, fenv_amount;
	char v_level, v_attack, v_start, v_freq, f1b, v_pitch;
};
struct mix { char level, pan, r[4]; };
struct pgm {
	char hdr[0x13];
	char note;
	char hdr2[0x0a];
	struct note notes[64];
	struct mix mix[64];
};
struct shdr {
	char name[0x1a];
	int w1a, w1c;
	char r1e[8];
	int w26, w28, w2a;
	char level, b2d;
	char r2e[2];
	int w30, w32;
	char r34;
	signed char c35, c36;
	char r37[4];
};
#pragma pack()

extern char B_56AA;
extern void (__far *W_56A6)(void);
extern char B_56C0;
extern char P_56AB[16];
extern struct pgm far *FP_56C2;
extern char G_SMEM_STATE_A;
extern char G_SMEM_STATE_B;
extern char STR_EXT_SET[1];
extern char STR_EXT_ST1[1];
extern signed char TBL_MPC60_PAD_SND[0x22];
extern struct shdr TBL_MPC60_SND_HDR[32];
extern signed char TBL_6459[0x20];
extern char TBL_6479[0x20];
extern char TBL_6499[0x20];
signed char far * __far int4D_sample_wrapper(void);
int __far midi_string_setup(void);
int __far tgt_0BC26(void);
struct pgm far * __far __pascal midi_stop_helper(int, char far *);
int __far __pascal midi_out_io2(int);
char __far __pascal midi_io_chain(int, int);
int __far sample_process_2(void);

int __far midi_string_handler(char far *name, int p0a, int p0c, char ch, int mode, int p12, int p14, void (__far *cb)(void))
{
	signed char far *q;
	struct pgm far *p;
	int i;
	int k;
	int n;

	B_56AA = ch;
	W_56A6 = cb;
	B_56C0 = 0;
	strcpy(P_56AB, name);
	q = int4D_sample_wrapper();
	if (!midi_string_setup())
		return 0;
	strcat(P_56AB, G_SMEM_STATE_A == 2 ? STR_EXT_SET : STR_EXT_ST1);
	if (mode == 2)
		return tgt_0BC26();
	if (!(FP_56C2 = p = midi_stop_helper(mode, name)))
		return 0;
	for (i = 0; i < 0x22; i++) {
		k = TBL_MPC60_PAD_SND[i];
		n = q[i] - 0x23;
		if (k == -1)
			continue;
		if (!TBL_MPC60_SND_HDR[k].name[0])
			continue;
		p->notes[n].tune = G_SMEM_STATE_B ? TBL_MPC60_SND_HDR[k].w1a + TBL_MPC60_SND_HDR[k].w1c
			: midi_out_io2(TBL_MPC60_SND_HDR[k].w2a);
		p->notes[n].attack = midi_io_chain(TBL_MPC60_SND_HDR[k].w26, 1);
		p->notes[n].decay = midi_io_chain(TBL_MPC60_SND_HDR[k].w28, 1);
		if (G_SMEM_STATE_B)
			p->notes[n].v_level = TBL_MPC60_SND_HDR[k].b2d;
		else
			p->notes[n].v_level = 100;
		if (G_SMEM_STATE_B)
			p->notes[n].v_attack = midi_io_chain(TBL_MPC60_SND_HDR[k].w30, 1);
		else
			p->notes[n].v_attack = 0;
		if (G_SMEM_STATE_B)
			p->notes[n].v_start = midi_io_chain(TBL_MPC60_SND_HDR[k].w32, 1);
		else
			p->notes[n].v_start = 0;
		p->mix[n].level = TBL_MPC60_SND_HDR[k].c35 * 25 / 32;
		p->mix[n].pan = TBL_MPC60_SND_HDR[k].c36 * 25 / 32;
	}
	n = q[0] - 0x23;
	p->notes[n].mode = 3;
	p->notes[n].sw1 = 0x0e;
	p->notes[n].alt1 = q[1];
	p->notes[n].sw2 = 0x2a;
	p->notes[n].alt2 = q[2];
	p->notes[n].mute1 = q[1];
	p->notes[n].mute2 = q[2];
	p->notes[n].dcy_mode = 1;
	p->note = n + 0x23;
	p->notes[n].f1b = 1;
	for (i = 1; i < 0x20; i++) {
		if (TBL_6459[i] <= 0)
			continue;
		n = q[i + 2];
		if (TBL_6479[i] == 1)
			p->notes[n - 0x23].mode = 2;
		else
			p->notes[n - 0x23].mode = 1;
		p->notes[n - 0x23].alt1 = q[TBL_6459[i] + 1];
		p->notes[n - 0x23].sw1 = TBL_6499[i];
		p->notes[n - 0x23].sw2 = 0x7f;
	}
	return sample_process_2();
}
