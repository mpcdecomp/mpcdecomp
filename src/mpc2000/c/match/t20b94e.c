char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(strcpy)

#pragma pack(1)
struct snd_hdr {
	char name[0x12];
	long ofs;
	long len;
	char r1a[8];
	int a;
	int b;
	char r26[6];
	char level;
	char r2d[0x0e];
};
struct snd_desc {
	char name[0x11];
	char level;
	char tune;
	char flag;
	long start;
	long end;
	long len;
	char r20[0x10];
	int pool_idx;
	char r32[4];
};
struct smem_pool {
	long base;
	char r4[6];
};
#pragma pack()

extern struct snd_hdr TBL_MPC60_SND_HDR[32];
extern struct smem_pool SMEM_POOL[16];
extern char G_SMEM_STATE_A;
extern char G_SMEM_STATE_B;
extern int G_ERRNO;
extern long W_5BBC;
extern char far *W_50A0;
extern long W_50A4;
extern long W_50A8;
extern long G_MPC60_LOAD_LEN;
extern char B_56BE;
extern char P_56AB[16];

int __far _setjmp(int far *);
void __far _longjmp(int far *, int);
void __far __pascal sample_desc_init(struct snd_desc far *);
void __far __pascal sample_validate_ptr(char far *);
void __far err_msg_report(void);
void __far __pascal smem_free(int);
int __far __pascal mem_io_handler(int far *, long, int);
char far * __far __pascal sample_pool_add(struct snd_desc);
void __far fn_0D9CE(int);
int __far int2F_call_fn4(char far *);
void __far int2F_bcd_wrapper2(long);
int __far __pascal sample_data_load_12bit(long, long);
void __far int2F_dispatch_10(void);
int __far sample_load_step(void);
void __far X_0C236(void);

int __far __pascal sample_load_entry(char far * far *snd, int i)
{
	struct snd_desc d;
	int jb[9];
	long ofs;

	if (i == -1 || !TBL_MPC60_SND_HDR[i].name[0])
		return 0;
	ofs = TBL_MPC60_SND_HDR[i].ofs;
	sample_desc_init(&d);
	strcpy(d.name, TBL_MPC60_SND_HDR[i].name);
	d.len = TBL_MPC60_SND_HDR[i].len;
	d.start = TBL_MPC60_SND_HDR[i].a * 40L;
	d.end = TBL_MPC60_SND_HDR[i].b * 40L;
	d.tune = 0xef;
	if (G_SMEM_STATE_B == 1)
		d.level = TBL_MPC60_SND_HDR[i].level;
	else
		d.level = 100;
	d.flag = 0;
	if (d.start > d.len) d.start = d.len;
	if (d.end > d.len) d.end = d.len;
	if (G_ERRNO = _setjmp(jb)) {
		switch (G_ERRNO) {
		case 4:
			int2F_dispatch_10();
		case 12:
			sample_validate_ptr(*snd);
		default:
		dflt:
			err_msg_report();
			return 0;
		case 9:
			smem_free(d.pool_idx);
			err_msg_report();
			return 0;
		}
	}
	if (!mem_io_handler(&d.pool_idx, d.len, 0)) _longjmp(jb, G_ERRNO);
	*snd = sample_pool_add(d);
	if (!*snd) _longjmp(jb, 9);
	fn_0D9CE(1);
	if (G_SMEM_STATE_A != 2) {
		if (G_SMEM_STATE_A == 5) {
			if (ofs + d.len < W_5BBC) goto load;
			if (ofs > W_5BBC) {
				W_50A0 = *snd;
				W_50A4 = (ofs - W_5BBC) * 3 / 2;
				W_50A8 = SMEM_POOL[d.pool_idx].base;
				G_MPC60_LOAD_LEN = d.len;
			} else {
				if (int2F_call_fn4(P_56AB) == -1) _longjmp(jb, 12);
				int2F_bcd_wrapper2((ofs / 2 + 0x400) * 3);
				if (!sample_data_load_12bit(SMEM_POOL[d.pool_idx].base, W_5BBC - ofs)) _longjmp(jb, 4);
				int2F_dispatch_10();
				W_50A0 = *snd;
				W_50A4 = 0;
				W_50A8 = SMEM_POOL[d.pool_idx].base - ofs + W_5BBC;
				G_MPC60_LOAD_LEN = ofs + d.len - W_5BBC;
			}
			B_56BE = 0x32;
			switch (sample_load_step()) {
			case 0:
				return 0;
			case 1:
				X_0C236();
				return 1;
			default:
				return 2;
			}
		}
		return 2;
	}
load:
	if (int2F_call_fn4(P_56AB) == -1) _longjmp(jb, 12);
	int2F_bcd_wrapper2((ofs / 2 + 0x400) * 3);
	if (sample_data_load_12bit(SMEM_POOL[d.pool_idx].base, d.len)) return 2;
	_longjmp(jb, 4);
	return 2;
}
