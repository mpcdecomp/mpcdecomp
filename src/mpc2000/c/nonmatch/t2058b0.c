/* differs: 150 size 294, image 220; +1 image `enter 6, 0` CL `enter 0xc, 0`; 172 size 294, image 220; +1 image `enter 6, 0` CL `enter 0xc, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[19];
    char f_13;
    char f_14;
    char f_15;
    char f_16;
    char f_17;
    char f_18;
    char f_19;
    char f_1a;
    char f_1b;
    char f_1c;
    char f_1d;
};
struct g_PGM_TABLE {
    int f_0;
    int f_2;
};
extern unsigned char PGM_MIX[1];
extern unsigned char PGM_PADMAP[1];
extern struct g_PGM_TABLE PGM_TABLE;
extern long __far __pascal _memcpy_2(long, int);
extern long __far __pascal _memcpy_3(long);
extern long __far __pascal _memset_2(long);
extern long __far __pascal far_memop_str_1(unsigned char far *);
extern long __far __pascal far_memop_str_2(long);

void __far __pascal far_memop_handler_1(int arg_0)
{
	struct s1 far *loc_6;
	char loc_4[3];
	char loc_1;
	int ax;
	int bx;
	int di;
	int ds;
	int dx;
	int es;
	long t1;
	long t2;
	long t3;
	long t4;

	bx = arg_0 << 2;
	dx = *(int *)((char *)&PGM_TABLE + 2 + bx);
	*(int *)((char *)&loc_6 + 0) = *(int *)((char *)&PGM_TABLE + 0 + bx);
	*(int *)((char *)&loc_4 + 0) = dx;
	t1 = _memcpy_2(((long)*(int *)((char *)&loc_4 + 0) << 16 | (unsigned)(*(int *)((char *)&loc_6 + 0) + 2)), arg_0);
	loc_6->f_13 = (char)0;
	loc_6->f_14 = (char)-120;
	loc_6->f_15 = (char)120;
	loc_6->f_16 = (char)12;
	loc_6->f_17 = (char)45;
	loc_6->f_18 = (char)0;
	loc_6->f_19 = (char)20;
	loc_6->f_1a = (char)-50;
	loc_6->f_1b = (char)50;
	loc_6->f_1c = *(char *)((char *)&arg_0 + 0);
	loc_6->f_1d = (char)35;
	__movs2((unsigned char far *)MK_FP(FP_SEG(loc_6), (unsigned int)(unsigned)(PGM_PADMAP + FP_OFF(loc_6))), MK_FP(SEG_DATA, -0x72c8), 64);
	ax = (int)_memset_2(((long)*(int *)((char *)&loc_4 + 0) << 16 | (unsigned)(*(int *)((char *)&loc_6 + 0) + 30)));
	loc_1 = (char)1;
	es = *(int *)((char *)&loc_4 + 0);
	ds = SEG_DATA;
L1:
	di = *(int *)((char *)&loc_6 + 0) + 30 + loc_1 * 29;
	__movs2(MK_FP(es, di), MK_FP(es, *(int *)((char *)&loc_6 + 0) + 30), 28);
	*(char far *)MK_FP(es, di + 28) = *(char far *)MK_FP(es, *(int *)((char *)&loc_6 + 0) + 58);
	ds = ds;
	loc_1 = (char)(loc_1 + 1);
	if (loc_1 < 64) {
		goto L1;
	}
	t2 = far_memop_str_1((unsigned char far *)MK_FP(es, (unsigned int)(unsigned)(PGM_MIX + *(int *)((char *)&loc_6 + 0))));
	t3 = _memcpy_3(((long)*(int *)((char *)&loc_4 + 0) << 16 | (unsigned)(*(int *)((char *)&loc_6 + 0) + 0x91e)));
	t4 = far_memop_str_2(((long)*(int *)((char *)&loc_4 + 0) << 16 | (unsigned)(*(int *)((char *)&loc_6 + 0) + 0x9ae)));
	return;
}
