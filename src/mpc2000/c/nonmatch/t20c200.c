/* differs: 150 size 418, image 248; +1 image `enter 0x10, 0` CL `enter 0x2e, 0`; 172 size 418, image 248; +1 image `enter 0x10, 0` CL `enter 0x2e, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
    char f_4;
};
extern unsigned char P_8D44[1];
extern unsigned char P_8D46;
extern unsigned char TBL_SOUND_NAMES[1];

void __far __pascal ctrl_io_access(int arg_2, int arg_0)
{
	int loc_10;
	char loc_e[4];
	int loc_a;
	int loc_8;
	struct s1 far *loc_6;
	int loc_4;
	int loc_2;
	int bx;
	int bx2;
	unsigned int cx;
	int cx2;
	int cx3;
	int di;
	int di2;
	int di3;
	int di4;
	int ds;
	int dx;
	int dx2;
	int dx3;
	int p24;
	int p26;
	int p28;
	int si;
	int si2;
	int t1;

	loc_2 = 0;
	p24 = SEG_DATA;
	__stos2(((long)p24 << 16 | (unsigned)(unsigned int)(unsigned)TBL_SOUND_NAMES), 0, 0x880);
	__stos2(((long)p24 << 16 | (unsigned)(unsigned int)(unsigned)P_8D44), 0, 0x200);
	di = (int)(unsigned)(P_8D44 + 0x200);
	si = arg_0 + 30;
	loc_4 = arg_2;
	loc_a = 64;
	*(int *)((char *)&loc_6 + 0) = arg_0 + 30;
	ds = SEG_DATA;
L1:
	dx = *(int far *)MK_FP(loc_4, *(int *)((char *)&loc_6 + 0) + 2);
	loc_10 = *(int far *)MK_FP(loc_4, *(int *)((char *)&loc_6 + 0));
	*(int *)((char *)&loc_e + 0) = dx;
	if ((*(int *)((char *)&loc_e + 0) | loc_10) != 0) {
		goto L2;
	}
	*(char far *)MK_FP(loc_4, *(int *)((char *)&loc_6 + 0) + 4) = (char)-1;
	goto L3;
L2:
	bx = 0;
	loc_8 = bx;
	if (loc_2 <= bx) {
		goto L4;
	}
	di = (int)(unsigned)P_8D44;
L5:
	dx2 = *(int far *)MK_FP(ds, di + 2);
	if (loc_10 != *(int far *)MK_FP(ds, di)) {
		goto L6;
	}
	if (*(int *)((char *)&loc_e + 0) == dx2) {
		goto L7;
	}
L6:
	di = di + 4;
	bx = bx + 1;
	if (loc_2 > bx) {
		goto L5;
	}
	loc_8 = bx;
	goto L4;
L7:
	loc_8 = bx;
	loc_6->f_4 = *(char *)((char *)&loc_8 + 0);
L4:
	if (loc_2 != loc_8) {
		goto L3;
	}
	loc_6->f_4 = *(char *)((char *)&loc_8 + 0);
	dx3 = loc_6->f_2;
	bx2 = loc_8 << 2;
	*(int far *)MK_FP(ds, (unsigned)&P_8D44 + bx2) = loc_6->f_0;
	*(int far *)MK_FP(ds, (unsigned)&P_8D46 + bx2) = dx3;
	di2 = *(int far *)MK_FP(ds, (unsigned)&P_8D44 + bx2);
	p24 = ds;
	t1 = __repne_scas1((int)((long)dx3 << 16 | (unsigned)di2), 0, -1);
	cx = ~t1;
	di3 = di2 + (-1 - t1) - cx;
	p26 = ds;
	p28 = dx3;
	cx2 = cx >> 1;
	__movs2(((long)p26 << 16 | (unsigned)di3), ((long)p28 << 16 | (unsigned)di3), cx2 * 2);
	si2 = di3 + cx2 * 2;
	di4 = di3 + cx2 * 2;
	cx3 = cx & 1;
	__movs1(((long)p26 << 16 | (unsigned)di4), ((long)p28 << 16 | (unsigned)si2), cx3);
	si = si2 + cx3;
	di = di4 + cx3;
	ds = p24;
	loc_2 = loc_2 + 1;
L3:
	*(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 29;
	loc_a = loc_a - 1;
	if (loc_a == 1) {
		goto L8;
	}
	goto L1;
L8:
	return;
}
