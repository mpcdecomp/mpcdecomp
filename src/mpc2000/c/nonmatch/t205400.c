/* differs: 150 size 332, image 290; +1 image `enter 0x12, 0` CL `enter 0x1c, 0`; 172 size 332, image 5; +1 image `enter 0x12, 0` CL `enter 0x1c, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[71];
    char f_47;
};
struct s2 {
    char pad_0[10];
    char f_a;
    char f_b;
};
extern unsigned char G_COPY_DST_NOTE;
extern unsigned char G_COPY_DST_PGM;
extern unsigned char G_COPY_SRC_NOTE;
extern unsigned char G_COPY_SRC_PGM;
extern unsigned char PGM_TABLE;
extern long __far __fastcall __loadds copy_fx_close(void);
extern int __far __pascal pending_ops_set(int);

void __far __fastcall __loadds cmd_block_copy(void)
{
	long loc_12;
	int loc_10;
	long loc_e;
	char loc_c[3];
	char loc_9;
	struct s1 far *loc_8;
	int loc_6;
	char loc_5;
	struct s2 far *loc_4;
	int loc_2;
	int ax;
	int ax2;
	int bx;
	int bx2;
	int cx;
	int cx2;
	int cx3;
	int ds;
	int ds2;
	int dx;
	int dx2;
	int t1;
	long t2;

	ds = SEG_DATA;
	bx = *(char far *)MK_FP(ds, (unsigned)&G_COPY_SRC_PGM) << 2;
	ax = *(int far *)MK_FP(ds, (unsigned)&PGM_TABLE + bx);
	dx = *(int far *)MK_FP(ds, (unsigned)&PGM_TABLE + 2 + bx);
	cx = ((char)(SEG_DATA >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&G_COPY_SRC_NOTE));
	*(int *)((char *)&loc_e + 0) = ax + (unsigned char)(char)cx * 72 + 0x91e;
	*(int *)((char *)&loc_c + 0) = dx;
	cx2 = (unsigned char)(char)cx * 12;
	*(int *)((char *)&loc_12 + 0) = ax + cx2 + 0x9ae;
	loc_10 = *(int *)((char *)&loc_c + 0);
	bx2 = *(char far *)MK_FP(ds, (unsigned)&G_COPY_DST_PGM) << 2;
	ax2 = *(int far *)MK_FP(ds, (unsigned)&PGM_TABLE + bx2);
	dx2 = *(int far *)MK_FP(ds, (unsigned)&PGM_TABLE + 2 + bx2);
	cx3 = ((char)(cx2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(ds, (unsigned)&G_COPY_DST_NOTE));
	*(int *)((char *)&loc_8 + 0) = ax2 + (unsigned char)(char)cx3 * 72 + 0x91e;
	loc_6 = dx2;
	*(int *)((char *)&loc_4 + 0) = ax2 + (unsigned char)(char)cx3 * 12 + 0x9ae;
	loc_2 = loc_6;
	if (*(char far *)MK_FP(ds, (unsigned)&G_COPY_DST_PGM) != *(char far *)MK_FP(ds, (unsigned)&G_COPY_SRC_PGM)) {
		goto L1;
	}
	if (*(char far *)MK_FP(ds, (unsigned)&G_COPY_SRC_NOTE) != *(char far *)MK_FP(ds, (unsigned)&G_COPY_DST_NOTE)) {
		goto L1;
	}
	goto L2;
L1:
	if ((unsigned char)*(char far *)MK_FP(ds, (unsigned)&G_COPY_SRC_NOTE) >= 2) {
		goto L3;
	}
	if ((unsigned char)*(char far *)MK_FP(ds, (unsigned)&G_COPY_DST_NOTE) >= 2) {
		goto L3;
	}
	loc_9 = loc_8->f_47;
	__movs2(loc_8, loc_e, 72);
	ds = ds;
	*(char far *)MK_FP(FP_SEG(loc_8), *(int *)((char *)&loc_8 + 0) + 71) = loc_9;
L3:
	loc_5 = loc_4->f_a;
	*(char *)((char *)&loc_6 + 0) = loc_4->f_b;
	__movs2(loc_4, loc_12, 12);
	ds2 = ds;
	if ((unsigned char)*(char far *)MK_FP(ds2, (unsigned)&G_COPY_SRC_NOTE) >= 2) {
		goto L4;
	}
	if ((unsigned char)*(char far *)MK_FP(ds2, (unsigned)&G_COPY_DST_NOTE) < 2) {
		goto L4;
	}
	*(char far *)MK_FP(FP_SEG(loc_4), *(int *)((char *)&loc_4 + 0) + 10) = loc_5;
	*(char far *)MK_FP(FP_SEG(loc_4), *(int *)((char *)&loc_4 + 0) + 11) = *(char *)((char *)&loc_6 + 0);
L4:
	t1 = pending_ops_set(15);
	t2 = copy_fx_close();
L2:
	return;
}
