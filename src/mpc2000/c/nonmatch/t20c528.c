/* differs: 150 size 106, image 104; +1 image `enter 8, 0` CL `enter 0xa, 0`; 172 size 106, image 104; +1 image `enter 8, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PGM_TABLE {
    long f_0;
};
extern char B_9D5A;
extern struct g_PGM_TABLE PGM_TABLE;
extern long __far __pascal bcd_display_calc();
extern long __far __pascal pgm_file_write(long);

void __far smem_ctrl_setup_1(void)
{
	int loc_8;
	char loc_6[4];
	int loc_2;
	int ax;
	int bx;
	int cx;
	int dx;
	int es;
	int p14;
	int p16;
	int p18;
	int p20;
	long t1;
	long t2;
	long t3;

	loc_8 = B_9D5A;
	p14 = SEG_STACK;
	p16 = (int)(unsigned)&loc_8;
	p18 = 2;
	p20 = 0x0b50;
	t1 = bcd_display_calc(p14, p16, p18);
	cx = UNDEF;
	ax = (int)t1;
	dx = (int)(t1 >> 16);
	if (ax != 0) {
		goto L1;
	}
L2:
	return;
L1:
	*(int *)((char *)&loc_6 + 0) = 0;
L3:
	bx = (int)*(long *)((char *)&PGM_TABLE + 0 + (*(int *)((char *)&loc_6 + 0) << 2));
	es = (int)(*(long *)((char *)&PGM_TABLE + 0 + bx) >> 16);
	loc_2 = es;
	if ((unsigned int)*(int far *)MK_FP(es, bx) <= 2) {
		goto L4;
	}
	p20 = 0x0b50;
	t2 = bcd_display_calc((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), 2);
	if ((int)t2 == 0) {
		goto L2;
	}
	p14 = loc_2;
	p16 = bx;
	p18 = 0x0b50;
	t3 = pgm_file_write(((long)p14 << 16 | (unsigned)p16));
	cx = UNDEF;
	ax = (int)t3;
	dx = (int)(t3 >> 16);
	if (ax == 0) {
		goto L2;
	}
L4:
	*(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 1;
	if (*(int *)((char *)&loc_6 + 0) < 24) {
		goto L3;
	}
	return;
}
